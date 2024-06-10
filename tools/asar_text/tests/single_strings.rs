mod common;
use common::assert_simple;

#[test]
fn simple_string() {
    assert_simple(
        r#"; @STRING@ "  Ein Korridor zum Pier""#,
        r#"db ' ',' ','E','i','n',' ','K','o','r','r','i','d','o','r',' ',$FE,'P','i','e','r',$00 ; @STRING@ "  Ein Korridor zum Pier""#,
    )
}

#[test]
fn simple_with_previous_stuff() {
    assert_simple(
        r#"Something ; @STRING@ "  Ein Korridor zum Pier""#,
        r#"db ' ',' ','E','i','n',' ','K','o','r','r','i','d','o','r',' ',$FE,'P','i','e','r',$00 ; @STRING@ "  Ein Korridor zum Pier""#,
    )
}
