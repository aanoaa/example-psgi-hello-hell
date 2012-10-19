my $app = sub {
  my $env = shift;
  return [
      '200',
      [ 'Content-Type' => 'text/plain' ],
      [ "Hello Hell" ], # or IO::Handle-like object
  ];
};
