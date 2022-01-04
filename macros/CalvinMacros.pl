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
        'format' => 'png',
        @_
    );

  my $img = rserve_start_plot($arg{'format'}, $arg{'width'}, $arg{'height'});

  rserve_eval(
    'library(ggformula); ' .
    $arg{'precode'} . '; ' .
    'theme_set(' . $arg{'theme'} . ');' .
    'print(' . $arg{'code'} . ');'
  );

  rserve_finish_plot($img);
};

1;