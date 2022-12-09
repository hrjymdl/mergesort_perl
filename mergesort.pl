sub mergeSort {

    my @array = @_;
    return @array if @array < 2; 
    
    my $div = int(@array / 2);
    my @left = @array[0..$div-1];
    my @right = @array[$div..$#array];


    @left = mergeSort(@left);
    @right = mergeSort(@right);

    my $i = my $j = my $k = 0;


    while ($i < @left && $j < @right) {
        if ($left[$i] < $right[$j]) {
            $array[$k] = $left[$i];
            $i++;
        } else {
            $array[$k] = $right[$j];
            $j++;
        }
        $k++;
    }


    while ($i < @left) {
        $array[$k] = $left[$i];
        $i++;
        $k++;
    }

    while ($j < @right) {
        $array[$k] = $right[$j];
        $j++;
        $k++;
    }

    return @array;
}


print "Enter a list of comma-separated numbers: ";
my $input = <STDIN>;
my @array = map { int } split(/\s*,\s*/, $input);
@array = mergeSort(@array);
print(join(", ", @array));
