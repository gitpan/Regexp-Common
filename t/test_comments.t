# VOODOO LINE-NOISE
my($C,$M,$P,$N,$S);END{print"1..$C\n$M";print"\nfailed: $N\n"if$N}
sub ok{$C++; $M.= ($_[0]||!@_)?"ok $C\n":($N++,"not ok $C (".
((caller 1)[1]||(caller 0)[1]).":".((caller 1)[2]||(caller 0)[2]).")\n")}
sub try{$P=qr/^$_[0]$/}sub fail{ok($S=$_[0]!~$P)}sub pass{ok($S=$_[0]=~$P)}

# LOAD

use Regexp::Common;
ok;

# TEST C COMMENTS

try $RE{comment}{C};

pass '/*a comment */';
pass '/************/';
pass "/*a\nmultiline\ncomment*/";
fail "/*a /*pretend*/ nested comment*/";
pass "/*a /*pretend*/";
fail "/***********";
fail "#\n";
fail "#a comment\n";
fail "#/*a comment */\n";
fail "#/************\n";
fail "#/////////////\n";
fail "#a\n#multiline\n#comment\n/";
fail "#a comment";
fail "#/*a comment */";
fail "#/************";
fail "#/////////////";


try $RE{comment}{'C++'};

pass "//\n";
pass "//a comment\n";
pass "///*a comment */\n";
pass "///************\n";
pass "///////////////\n";
fail "//a\n//multiline\n//comment\n/";
fail "//a comment";
fail "///*a comment */";
fail "///************";
fail "///////////////";
pass '/*a comment */';
pass '/************/';
pass "/*a\nmultiline\ncomment*/";
fail "/*a /*pretend*/ nested comment*/";
pass "/*a /*pretend*/";
fail "/***********";
fail "#\n";
fail "#a comment\n";
fail "#/*a comment */\n";
fail "#/************\n";
fail "#/////////////\n";
fail "#a\n#multiline\n#comment\n/";
fail "#a comment";
fail "#/*a comment */";
fail "#/************";
fail "#/////////////";


try $RE{comment}{Perl};

pass "#\n";
pass "#a comment\n";
pass "#/*a comment */\n";
pass "#/************\n";
pass "#/////////////\n";
fail "#a\n#multiline\n#comment\n/";
fail "#a comment";
fail "#/*a comment */";
fail "#/************";
fail "#/////////////";
fail "//a comment\n";
fail "///*a comment */\n";
fail "///************\n";
fail "///////////////\n";
fail "//a\n//multiline\n//comment\n/";
fail "//a comment";
fail "///*a comment */";
fail "///************";
fail "///////////////";
fail '/*a comment */';
fail '/************/';
fail "/*a\nmultiline\ncomment*/";
fail "/*a /*pretend*/ nested comment*/";
fail "/*a /*pretend*/";
fail "/***********";


try $RE{comment}{shell};

pass "#\n";
pass "#a comment\n";
pass "#/*a comment */\n";
pass "#/************\n";
pass "#/////////////\n";
fail "#a\n#multiline\n#comment\n/";
fail "#a comment";
fail "#/*a comment */";
fail "#/************";
fail "#/////////////";
fail "//a comment\n";
fail "///*a comment */\n";
fail "///************\n";
fail "///////////////\n";
fail "//a\n//multiline\n//comment\n/";
fail "//a comment";
fail "///*a comment */";
fail "///************";
fail "///////////////";
fail '/*a comment */';
fail '/************/';
fail "/*a\nmultiline\ncomment*/";
fail "/*a /*pretend*/ nested comment*/";
fail "/*a /*pretend*/";
fail "/***********";


try $RE{comment}{HTML};

pass '<!-- A comment -->';
pass '<!-- A comment with trailing white space --   >';
pass "<!-- A comment with a new\nline -->";
pass "<!-- A comment with trailing new lines --\n\n>";
pass '<!-- Multi comment --  -- This is a comment too -->';
pass '<!---------------->';
pass '<!---->';
pass '<!-- A comment with - two - dashes -->';
pass '<!-- Multi comments with - two - dashes -- ---- >';
pass '<!-- -- --> Comment <!-- -- -->';
pass '<!------><a href = "http://cpan.perl.org">Click here!</a><!------>';
pass '<!>';   # Empty comment.
fail '<!->';
fail '<!-->';
fail '<!--->';
fail '<!-- Comment -- Not a comment -->';
fail '-- No MDO -->';
fail '<-- No MDO either -->';
fail '<!-- No MDC --';
fail '<! No leading COM -->';
fail '<!- No leading COM either -->';
fail '<!-- No trailing COM>';
fail '<!-- No trailing COM either ->';
fail '<!-- To many dashes --->';
