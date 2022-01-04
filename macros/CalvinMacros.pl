sub hash2seed {
  # warn("Student name: $studentName, login: $studentLogin, id: $studentID");
  my $hash = crypt($_[0], 'a1');
  # warn("crypt: $hash");
  my @nums = (0..9,'a'..'z','A'..'Z');
  my %nums = map { $nums[$_] => $_ } 0..$#nums;
  my $seed = 0;
  $seed = $seed * 62 + $nums{$_} foreach split(//, substr($hash, -5, 5));
  # warn("seed: " . $seed);

  return seed;
};

1;