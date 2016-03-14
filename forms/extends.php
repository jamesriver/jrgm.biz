<?php

function escape_characters($string) {
    if(is_numeric($string))
        return $string;
    $string = str_replace("'", "''", $string);
    
    return $string;
}
?>