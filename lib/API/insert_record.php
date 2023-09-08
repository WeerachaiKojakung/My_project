<?php


include("dbcoonection.php");
$con=dbcoonection

if(isset($_POST["planting_date_and_time"]))
{
  $planting_date_and_time$_POST["planting_date_and_time"];
}
else return;

if(isset($_POST["tomato_tree_species"]))
{
  $tomato_tree_species$_POST["tomato_tree_species"];
}
else return;

if(isset($_POST["quantity_grown"]))
{
  $quantity_grown$_POST["quantity_grown"];
}
else return;

if(isset($_POST["greenhouse_where_planted"]))
{
  $greenhouse_where_planted$_POST["greenhouse_where_planted"];
}
else return;




INSERT INTO `crud`(`id`, `planting_date_and_time`, `tomato_tree_species`, `quantity_grown`, `greenhouse_where_planted`) 
// VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]')
VALUES ('$planting_date_and_time', '$tomato_tree_species', '$quantity_grown', '$greenhouse_where_planted')
$exe=mysql_connect($con,$query);

$arr=[]
if ($exe){
  $arr["success"]="ture";
}
else {
  $arr["success"]="ture";
}
print(json_encode($arr));


?>