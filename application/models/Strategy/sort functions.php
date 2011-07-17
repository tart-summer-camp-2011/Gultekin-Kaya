function quicksort($array) {
    if(count($array) < 2) return $array;

    $left = $right = array();

    reset($array);
    $pivot_key = key($array);
    $pivot = array_shift($array);

    foreach($array as $k => $v) {
        if($v < $pivot)
            $left[$k] = $v;
        else
            $right[$k] = $v;
    }

    return array_merge(quicksort($left), array($pivot_key => $pivot), quicksort($right));
}

function bubbleSort ($items) {
     $size = count($items);
     for ($i=0; $i<$size; $i++) {
          for ($j=0; $j<$size-1-$i; $j++) {
               if ($items[$j+1] < $items[$j]) {
                   arraySwap($items, $j, $j+1);
               }
          }
     }
     return $items;
 }

 function arraySwap (&$arr, $index1, $index2) {
     list($arr[$index1], $arr[$index2]) = array($arr[$index2], $arr[$index1]);
 }

function insertionSort ($array)
{
	for($j=1; $j < count($array); $j++){
	    $temp = $array[$j];
	    $i = $j;
	    while(($i >= 1) && ($array[$i-1] > $temp)){
	       $array[$i] = $array[$i-1];
	       $i--;
	    }
	    $array[$i] = $temp;
	}
	return $array;
}
