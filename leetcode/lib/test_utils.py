def test(num: int, expected: any, actual: any) -> None:
    print(f"--- Test {num} ---")
    if expected == actual:
        print(f"--- Test passed. {expected} == {actual} ---")
    else:
        print(f"--- Test failed. {expected} != {actual} ---")
