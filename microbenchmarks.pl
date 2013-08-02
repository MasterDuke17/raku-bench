[
 # empty test MUST appear first, so that --ignore-startup will work
 {
  name  => 'empty',
  perl5 => '',
  perl6 => '',
  nqp   => '',
 },
 {
  name  => 'zero',
  perl5 => '0',
  perl6 => '0',
  nqp   => '0',
 },
 {
  name  => 'hello',
  perl5 => 'say "Hello, World!"',
  perl6 => 'say "Hello, World!"',
  nqp   => 'say("Hello, World!")',
 },
 {
  name  => 'while_empty',
  scale => 1 << 10,
  perl5 => 'my $i = 0; while (++$i <= SCALE) { }',
  perl6 => 'my $i = 0; while (++$i <= SCALE) { }',
  nqp   => 'my $i := 0; while ($i := $i + 1) <= SCALE { }',
 },
 {
  name  => 'while_empty_native',
  scale => 1 << 10,
  perl5 => 'use integer; my $i = 0; while (++$i <= SCALE) { }',
  perl6 => 'my int $i = 0; while ($i = $i + 1) <= SCALE { }',
  nqp   => 'my int $i := 0; while ($i := $i + 1) <= SCALE { }',
 },
 {
  name  => 'while_bind',
  scale => 1 << 10,
  perl5 => 'use Data::Alias; alias my $a = 0; alias my $b = 1; my $i = 0; while (++$i <= SCALE) { alias $a = $b }',
  perl6 => 'my $a := 0; my $b := 1; my $i = 0; while (++$i <= SCALE) { $a := $b }',
  nqp   => 'my $a := 0; my $b := 1; my $i := 0; while ($i := $i + 1) <= SCALE { $a := $b }',
 },
 {
  name  => 'while_concat',
  scale => 1 << 10,
  perl5 => 'my $s = ""; my $i = 0; while (++$i <= SCALE) { $s .= "x" }',
  perl6 => 'my $s = ""; my $i = 0; while (++$i <= SCALE) { $s ~= "x" }',
  nqp   => 'my $s := ""; my $i := 0; while ($i := $i + 1) <= SCALE { $s := $s ~ "x" }',
 },
 {
  name  => 'while_concat_native',
  scale => 1 << 10,
  perl5 => 'use integer; my $s = ""; my $i = 0; while (++$i <= SCALE) { $s .= "x" }',
  perl6 => 'my str $s = ""; my int $i = 0; while (($i = $i + 1) <= SCALE) { $s = $s ~ "x" }',
  nqp   => 'my str $s := ""; my int $i := 0; while ($i := $i + 1) <= SCALE { $s := $s ~ "x" }',
 },
 {
  name  => 'while_push_join',
  scale => 1 << 7,
  perl5 => 'my @a; my $i = 0; while (++$i <= SCALE) { push @a, "x" }; my $s = join "" => @a;',
  perl6 => 'my @a; my $i = 0; while (++$i <= SCALE) { @a.push("x") }; my $s; $s = @a.join;',
  nqp   => 'my @a; my $i := 0; while ($i := $i + 1) <= SCALE { nqp::push(@a, "x"); }; my $s := nqp::join("",@a);',
 },
 {
  name  => 'while_push',
  scale => 1 << 7,
  perl5 => 'my @a; my $i = 0; while (++$i <= SCALE) { push @a, 1 }',
  perl6 => 'my @a; my $i = 0; while (++$i <= SCALE) { push @a, 1 }',
  nqp   => 'my @a; my $i := 0; while ($i := $i + 1) <= SCALE { nqp::push(@a, 1) }',
 },
 {
  name  => 'while_array_set',
  scale => 1 << 7,
  perl5 => 'my @a; my $i = 0; while (++$i <= SCALE) { $a[ $i ] = $i }',
  perl6 => 'my @a; my $i = 0; while (++$i <= SCALE) { @a[ $i ] = $i }',
  nqp   => 'my @a; my $i := 0; while ($i := $i + 1) <= SCALE { @a[ $i ] := $i }',
 },
 {
  name  => 'while_hash_set',
  scale => 1 << 7,
  perl5 => 'my %h; my $i = 0; while (++$i <= SCALE) { $h{ $i } = $i }',
  perl6 => 'my %h; my $i = 0; while (++$i <= SCALE) { %h{ $i } = $i }',
  nqp   => 'my %h; my $i := 0; while ($i := $i + 1) <= SCALE { %h{ $i } := $i }',
 },
 {
  name  => 'postwhile_nil',
  scale => 1 << 10,
  perl5 => 'my $i = -SCALE || exit(0); ()  while ++$i;',
  perl6 => 'my $i = -SCALE || exit(0); Nil while ++$i;',
  nqp   => 'my $i := -SCALE || nqp::exit(0); () while $i := $i + 1;',
 },
 {
  name  => 'postwhile_nil_native',
  scale => 1 << 10,
  perl5 => 'use integer; my $i = -SCALE || exit(0); ()  while ++$i;',
  perl6 => 'my int $i = -SCALE || exit(0); Nil while ($i = $i + 1);',
  nqp   => 'my int $i := -SCALE || nqp::exit(0); () while $i := $i + 1;',
 },
 {
  name  => 'loop_empty',
  scale => 1 << 10,
  perl5 => 'for  (my $i = 1; $i <= SCALE; ++$i) { }',
  perl6 => 'loop (my $i = 1; $i <= SCALE; ++$i) { }',
  nqp   => undef,
 },
 {
  name  => 'loop_empty_native',
  scale => 1 << 10,
  perl5 => 'use integer; for (my $i = 1; $i <= SCALE; ++$i) { }',
  perl6 => 'loop (my int $i = 1; $i <= SCALE; $i = $i + 1) { }',
  nqp   => undef,
 },
 {
  name  => 'for_empty',
  scale => 1 << 10,
  perl5 => 'for (1 .. SCALE) { }',
  perl6 => 'for (1 .. SCALE) { }; 1',
  nqp   => undef,
 },
 {
  name  => 'for_bind',
  scale => 1 << 10,
  perl5 => 'use Data::Alias; alias my $a = 0; alias my $b = 1; for (1 .. SCALE) { alias $a = $b; }',
  perl6 => 'my $a := 0; my $b := 1; for (1 .. SCALE) { $a := $b; }; 1',
  nqp   => undef,
 },
 {
  name  => 'for_assign',
  scale => 1 << 10,
  perl5 => 'my $a = 0; my $b = 1; for (1 .. SCALE) { $a = $b; }',
  perl6 => 'my $a = 0; my $b = 1; for (1 .. SCALE) { $a = $b; }; 1',
  nqp   => undef,
 },
 {
  name  => 'for_assign_native',
  scale => 1 << 10,
  perl5 => 'use integer; my $a = 0; my $b = 1; for (1 .. SCALE) { $a = $b; }',
  perl6 => 'my int $a = 0; my int $b = 1; for (1 .. SCALE) { $a = $b; }; 1',
  nqp   => undef,
 },
 {
  name  => 'for_postinc',
  scale => 1 << 10,
  perl5 => 'my $i = 0; for (1 .. SCALE) { $i++ }',
  perl6 => 'my $i = 0; for (1 .. SCALE) { $i++ }; 1',
  nqp   => undef,
 },
 {
  name  => 'for_postinc_native',
  scale => 1 << 10,
  perl5 => 'use integer; my $i = 0; for (1 .. SCALE) { $i++ }',
  perl6 => 'my int $i = 0; for (1 .. SCALE) { $i = $i + 1 }; 1',
  nqp   => undef,
 },
 {
  name  => 'for_concat',
  scale => 1 << 10,
  perl5 => 'my $s = ""; for (1 .. SCALE) { $s .= "x" }',
  perl6 => 'my $s = ""; for (1 .. SCALE) { $s ~= "x" }; 1',
  nqp   => undef,
 },
 {
  name  => 'for_concat_native',
  scale => 1 << 10,
  perl5 => 'use integer; my $s = ""; for (1 .. SCALE) { $s .= "x" }',
  perl6 => 'my str $s = ""; for (1 .. SCALE) { $s = $s ~ "x" }; 1',
  nqp   => undef,
 },
 {
  name  => 'for_concat_2',
  scale => 1 << 10,
  perl5 => 'my $x = "a"; my $y = ""; for (1 .. SCALE) { $y .= ($x . $x) }',
  perl6 => 'my $x = "a"; my $y = ""; for (1 .. SCALE) { $y = ($x ~ $x) }; 1',
  nqp   => undef,
 },
 {
  name  => 'for_concat_2_native',
  scale => 1 << 10,
  perl5 => 'use integer; my $x = "a"; my $y = ""; for (1 .. SCALE) { $y .= ($x . $x) }',
  perl6 => 'my str $x = "a"; my str $y = ""; for (1 .. SCALE) { $y = $y ~ $x ~ $x }; 1',
  nqp   => undef,
 },
 {
  name  => 'for_push',
  scale => 1 << 7,
  perl5 => 'my @a; for (1 .. SCALE) { push @a, 1 }',
  perl6 => 'my @a; for (1 .. SCALE) { push @a, 1 }; 1',
  nqp   => undef,
 },
 {
  name  => 'for_array_set',
  scale => 1 << 10,
  perl5 => 'my @a; $a[ $_ ] = $_ for 1 .. SCALE',
  perl6 => 'my @a; @a[ $_ ] = $_ for 1 .. SCALE',
  nqp   => undef,
 },
 {
  name  => 'for_hash_set',
  scale => 1 << 10,
  perl5 => 'my %h; $h{ $_ } = $_ for 1 .. SCALE',
  perl6 => 'my %h; %h{ $_ } = $_ for 1 .. SCALE',
  nqp   => undef,
 },
 {
  name  => 'reduce_range',
  scale => 1 << 10,
  perl5 => 'use List::Util "reduce"; reduce { $a + $b } 1 .. SCALE',
  perl6 => '[+] 1 .. SCALE',
  nqp   => undef,
 },
 {
  name  => 'reduce_int_comb_range',
  scale => 1 << 7,
  perl5 => 'use List::Util "reduce"; reduce { $a + $b } map { 0+$_ } map { split "" } 1 .. SCALE',
  perl6 => '[+] (1 .. SCALE).comb>>.Int',
  nqp   => undef,
 },
 {
  name  => 'any_equals',
  scale => 1 << 7,
  perl5 => undef,
  perl6 => '1 == any(1 .. SCALE)',
  nqp   => undef,
 },
 {
  name  => 'trim_string',
  scale => 1 << 7,
  perl5 => 'my $s = " " x SCALE . "x" x SCALE . " " x SCALE; my ($result) = $s =~ /^\s*(.*?)\s*$/s for 1 .. SCALE',
  perl6 => 'my $s = " " x SCALE ~ "x" x SCALE ~ " " x SCALE; $s.trim for 1 .. SCALE',
  nqp   => undef,
 },
 {
  name  => 'visit_2d_indices_while',
  scale => 1 << 3,
  perl5 => 'my $i = 0; while ($i < SCALE) { my $j = 0; while ($j < SCALE) { $i + $j; $j++ }; $i++ }',
  perl6 => 'my $i = 0; while ($i < SCALE) { my $j = 0; while ($j < SCALE) { $i + $j; $j++ }; $i++ }',
  nqp   => 'my $i := 0; while ($i < SCALE) { my $j := 0; while ($j < SCALE) { $i + $j; $j := $j + 1 }; $i := $i + 1 }',
 },
 {
  name  => 'visit_2d_indices_while_native',
  scale => 1 << 3,
  perl5 => 'use integer; my $i = 0; while ($i < SCALE) { my $j = 0; while ($j < SCALE) { $i + $j; $j++ }; $i++ }',
  perl6 => 'my int $i = 0; while ($i < SCALE) { my int $j = 0; while ($j < SCALE) { $i + $j; $j = $j + 1 }; $i = $i + 1 }',
  nqp   => 'my int $i := 0; while ($i < SCALE) { my int $j := 0; while ($j < SCALE) { $i + $j; $j := $j + 1 }; $i := $i + 1 }',
 },
 {
  name  => 'visit_2d_indices_loop',
  scale => 1 << 3,
  perl5 => 'for  (my $i = 0; $i < SCALE; $i++) { for  (my $j = 0; $j < SCALE; $j++) { $i + $j } }',
  perl6 => 'loop (my $i = 0; $i < SCALE; $i++) { loop (my $j = 0; $j < SCALE; $j++) { $i + $j } }',
  nqp   => undef,
 },
 {
  name  => 'visit_2d_indices_loop_native',
  scale => 1 << 3,
  perl5 => 'use integer; for (my $i = 0; $i < SCALE; $i++) { for (my $j = 0; $j < SCALE; $j++) { $i + $j } }',
  perl6 => 'loop (my int $i = 0; $i < SCALE; $i = $i + 1) { loop (my int $j = 0; $j < SCALE; $j = $j + 1) { $i + $j } }',
  nqp   => undef,
 },
 {
  name  => 'visit_2d_indices_for',
  scale => 1 << 3,
  perl5 => 'for my $i (0 .. (SCALE - 1)) { for my $j (0 .. (SCALE - 1)) { $i + $j } }',
  perl6 => 'for ^SCALE -> $i { for ^SCALE -> $j { $i + $j }; 1 }; 1',
  nqp   => undef,
 },
 {
  name  => 'visit_2d_indices_cross',
  scale => 1 << 3,
  perl5 => undef,
  perl6 => 'for ^SCALE X ^SCALE -> $i, $j { $i + $j }; 1',
  nqp   => undef,
 },
 {
  name => 'create_and_iterate_hash_kv',
  scale => 1 << 3,
  perl5 => undef,
  perl6 => 'my %h; for ^SCALE { %h{$_} = $_ }; for %h.kv -> $k, $v { $k == $v }; 1',
  nqp   => undef,
 },
]
