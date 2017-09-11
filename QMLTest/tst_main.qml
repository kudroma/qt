import QtQuick 2.3
import QtTest 1.0

TestCase {
    name: "MathTests"

    function test_math_data() {
            return [
                {tag: "2 + 2 = 4", a: 2, b: 2, answer: 4 },
                {tag: "2 + 6 = 8", a: 2, b: 6, answer: 8 },
            ]
        }


    function test_math(data) {
        compare(data.a + data.b, data.answer)
    }

    function test_fail() {
        compare(2 + 2, 5, "2 + 2 = 5")
    }

    function benchmark_create_component() {
        var a, b;
        a = 3;
        b = 4;
        for(var i = 0; i < 100000000; i++)
        {
            a += b*a;
        }
    }
}
