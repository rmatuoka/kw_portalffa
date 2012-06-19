<?php
$xencode = isset($_GET["encode"])? $_GET["encode"] : "CODE39"; // tipo do encode
$xbdata = isset($_GET["bdata"])? $_GET["bdata"] : "1234567890"; //numero do codigo de barras a ser gerado
$xheight = isset($_GET["height"])? $_GET["height"] : "30"; //altura
$xscale = isset($_GET["scale"])? $_GET["scale"] : "2"; // escala 
$xbgcolor = isset($_GET["bgcolor"])? $_GET["bgcolor"] : "#FFFFFF"; //cor de fundo
$xcolor = isset($_GET["color"])? $_GET["color"] : "#000000"; // cor da barra

require("barcode.inc.php");

$encode = $xencode;
$bar= new BARCODE();

if($bar==false)
die($bar->error());
// OR $bar= new BARCODE("I2O5");

$barnumber = $xbdata;
//$barnumber="200780";
//$barnumber="801221905";
//$barnumber="A40146B";
//$barnumber="Code 128";
//$barnumber="TEST8052";
//$barnumber="TEST93";

$bar->setSymblogy($encode);
$bar->setHeight($xheight);
$bar->setFont("arial");
$bar->setScale($xscale);
$bar->setHexColor($xcolor,$xbgcolor);

/*$bar->setSymblogy("UPC-E");
$bar->setHeight(50);
$bar->setFont("arial");
$bar->setScale(2);
$bar->setHexColor("#000000","#FFFFFF");*/

//OR
//$bar->setColor(255,255,255) RGB Color
//$bar->setBGColor(0,0,0) RGB Color


$return = $bar->genBarCode($barnumber,$_REQUEST['type'],$_REQUEST['file' ]);
if($return==false)
$bar->error(true);

?>