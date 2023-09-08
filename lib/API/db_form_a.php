<?php
$servername = "localhost";
$username = "root"; // ชื่อผู้ใช้ MySQL
$password = ""; // รหัสผ่าน MySQL
$database = "tomatoA"; // ชื่อฐานข้อมูลที่คุณสร้างไว้

// สร้างการเชื่อมต่อกับ MySQL
$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// ตั้งค่า HTTP headers สำหรับรับข้อมูลแบบ JSON
header("Content-Type: application/json; charset=UTF-8");

// ตรวจสอบว่าเรียกใช้ API ด้วยเมทอด POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // รับข้อมูลที่ส่งมาในรูปแบบ JSON
    $data = json_decode(file_get_contents('php://input'), true);

    // ตรวจสอบว่าข้อมูลถูกส่งมาครบถ้วน
    if (isset($data['planting_date_and_time'], $data['tomato_tree_species'], $data['quantity_grown'], $data['greenhouse_where_planted'])) {
        $planting_date_and_time = $data['planting_date_and_time'];
        $tomato_tree_species = $data['tomato_tree_species'];
        $quantity_grown = $data['quantity_grown'];
        $greenhouse_where_planted = $data['greenhouse_where_planted'];

        // สร้างคำสั่ง SQL เพื่อเพิ่มข้อมูลลงในฐานข้อมูล
        $sql = "INSERT INTO your_table_name (planting_date_and_time, tomato_tree_species, quantity_grown, greenhouse_where_planted) 
                VALUES ('$planting_date_and_time', '$tomato_tree_species', $quantity_grown, '$greenhouse_where_planted')";

        if ($conn->query($sql) === TRUE) {
            // สร้างข้อมูลสำเร็จ
            $response = array("message" => "Data created successfully.");
            echo json_encode($response);
        } else {
            // เกิดข้อผิดพลาดในการสร้างข้อมูล
            $response = array("message" => "Error: " . $conn->error);
            echo json_encode($response);
        }
    } else {
        // ข้อมูลไม่ครบถ้วน
        $response = array("message" => "Missing required data.");
        echo json_encode($response);
    }
} elseif ($_SERVER['REQUEST_METHOD'] == 'GET') {
    // เรียกใช้ API ด้วยเมทอด GET เพื่อดึงข้อมูลทั้งหมดจากฐานข้อมูล
    $sql = "SELECT * FROM your_table_name";
    $result = $conn->query($sql);

    $data = array();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
    }

    // ส่งข้อมูลที่ดึงมาในรูปแบบ JSON
    echo json_encode($data);
} else {
    // เมทอด HTTP ไม่ถูกต้อง
    $response = array("message" => "Invalid HTTP method.");
    echo json_encode($response);
}

// ปิดการเชื่อมต่อกับ MySQL
$conn->close();
?>
