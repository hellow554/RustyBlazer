mod common;
use common::assert_simple;

#[test]
fn leave_others_alone() {
    assert_simple("Hello World", "Hello World");
}

#[test]
fn easy_string() {
    assert_simple(
        r#"\
; @NEW_TEXT@
; "Hello World"
; @END@"#,
        r#"\
; @NEW_TEXT@
; "Hello World"
db 'H','e','l','l','o',' ','W','o','r','l','d',$0D
; @END@"#,
    )
}

#[test]
fn test_sub() {
    assert_simple(
        r#"\
; @NEW_TEXT@
; "Mein Name ist Frank."
; @END@"#,
        r#"\
; @NEW_TEXT@
; "Mein Name ist Frank."
db $98,'N','a','m','e',' ',$D2,'F','r','a','n','k','.',$0D
; @END@"#,
    )
}

#[test]
fn test_point_to() {
    assert_simple(
        r#"\
; @NEW_TEXT@
; "Hallo" -> $abcd
; "Hallo" -> .other_label
; @END@"#,
        r#"\
; @NEW_TEXT@
; "Hallo" -> $abcd
; "Hallo" -> .other_label
db 'H','a','l','l','o',$13 : dw $ABCD
db 'H','a','l','l','o',$13 : dw .other_label
; @END@"#,
    )
}

#[test]
fn test_with_surrounding() {
    assert_simple(
        r#"\
LDA xxx
; @NEW_TEXT@
; "Ein magischer Tornado"
; @END@
Foo Bar"#,
        r#"\
LDA xxx
; @NEW_TEXT@
; "Ein magischer Tornado"
db 'E','i','n',' ','m','a','g','i','s','c','h','e','r',' ','T','o','r','n','a','d','o',$0D
; @END@
Foo Bar"#,
    )
}

#[test]
fn test_double_newline_at_end() {
    assert_simple(
        r#"\
; @NEW_TEXT@
; "Ein magischer Tornado \n\n"
; @END@"#,
        r#"\
; @NEW_TEXT@
; "Ein magischer Tornado \n\n"
db 'E','i','n',' ','m','a','g','i','s','c','h','e','r',' ','T','o','r','n','a','d','o',' ',$0D,$0D,$0D
; @END@"#,
    )
}

#[test]
fn test_lut_across_newlines() {
    assert_simple(
        r#"\
; @NEW_TEXT@
; "Hey, Du siehst so aus als würdest Du den Krabbenlauf beher-"
; "schen. Versuch`s mal."
; @END@"#,
        r#"\
; @NEW_TEXT@
; "Hey, Du siehst so aus als würdest Du den Krabbenlauf beher-"
; "schen. Versuch`s mal."
db 'H','e','y',',',' ',$83,'s','i','e','h','s','t',' ',$E9,$AD,$AF,'w','ü','r','d','e','s','t',' ',$83,$B7,'K','r','a','b','b','e','n','l','a','u','f',' ','b','e','h','e','r','-',$0D
db 's','c','h','e','n','.',' ','V','e','r','s','u','c','h','`','s',' ','m','a','l','.',$0D
; @END@"#,
    )
}

#[test]
fn test_starting_with_space() {
    assert_simple(
        r#"\
; @NEW_TEXT@
; " Nr1:\n\n"
; @END@"#,
        r#"\
; @NEW_TEXT@
; " Nr1:\n\n"
db ' ','N','r','1',':',$0D,$0D,$0D
; @END@"#,
    )
}

#[test]
fn test_punctuation() {
    assert_simple(
        r#"\
; @NEW_TEXT@
; "Na siehst Du ! Ich wußte daß Du es \nkannst. !"
; @END@"#,
        r#"\
; @NEW_TEXT@
; "Na siehst Du ! Ich wußte daß Du es \nkannst. !"
db 'N','a',' ','s','i','e','h','s','t',' ',$83,'!',' ',$8F,'w','u','ß','t','e',' ',$BA,$83,$C3,$0D,'k','a','n','n','s','t','.',' ','!',$0D
; @END@"#,
    )
}

#[test]
fn with_previous_stuff() {
    assert_simple(
        r#"\
LDA xxx
; @NEW_TEXT@
; "Ein magischer Tornado"
db ABC
DEF GHI #$82938 ; just a comment
;; this must be preserved!
ALKSDJLKASD
;; this as well!
; @END@
Foo Bar"#,
        r#"\
LDA xxx
; @NEW_TEXT@
; "Ein magischer Tornado"
;; this must be preserved!
;; this as well!
db 'E','i','n',' ','m','a','g','i','s','c','h','e','r',' ','T','o','r','n','a','d','o',$0D
; @END@
Foo Bar"#,
    )
}