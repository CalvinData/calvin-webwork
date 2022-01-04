sub hash2seed {
  # warn("Student name: $studentName, login: $studentLogin, id: $studentID");
  my $hash = crypt($_[0], 'a1');
  # warn("crypt: $hash");
  my @nums = (0..9,'a'..'z','A'..'Z');
  my %nums = map { $nums[$_] => $_ } 0..$#nums;
  my $seed = 0;
  $seed = $seed * 62 + $nums{$_} foreach split(//, substr($hash, -5, 5));
  # warn("seed: " . $seed);

  return $seed;
};

sub ggplot {
  my (%arg) = (
        'code' => '',
        'precode' => '',
        'theme' => 'theme_bw(base_size = 15)',
        'width' => 400,
        'height' => 250,
        'format' => 'png'
        @_
    );

  my $img = rserve_start_plot($arg['format]', $arg['width'], $arg['height']);

  rserve_eval(
    'library(ggformula); ' .
    $arg['precode'] . '; ' .
    'theme_set(' . $arg['theme'] . ');' .
    'print(' . $arg['code'] . ');'
  );

  rserve_finish_plot($img);
}

sub RAllEqualChecker = {

  my (%arg) = (
        'precode' => '',
        @_
    );

  return sub {
     my ($correct, $student, $ansHash) = @_;  # get correct and student MathObjects
     my ($student_code) = $student->value;    # get student answer
     rserve_eval($arg['precode']);
     my ($score) =
       rserve_eval("tryCatch(as.integer(isTRUE(all.equal( $correct, $student_code))), error = function(e) FALSE);");
     return $score;
   };
};

1;