my $app = sub {
  my $env = shift;
  my $list = `pwd`;
  return [
      '200',
      [ 'Content-Type' => 'text/plain' ],
      [ "Hello Hell : $list" ], # or IO::Handle-like object
  ];
};
