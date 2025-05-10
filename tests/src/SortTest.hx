// SPDX-License-Identifier: MIT
package;

import haxe.Exception;
import utest.Assert;
import utest.Test;

using lazylambda.Prelude;

class SortTest extends Test {

    public function test__Sorting_works_with_integers() {
    
        final array = [0, 1, 1, 1, 2, 3, 50, 4, 0, 50, 7];
        final iter = array.iterator().sorted();
        Assert.equals(0, iter.next());
        Assert.equals(0, iter.next());
        Assert.equals(1, iter.next());
        Assert.equals(1, iter.next());
        Assert.equals(1, iter.next());
        Assert.equals(2, iter.next());
        Assert.equals(3, iter.next());
        Assert.equals(4, iter.next());
        Assert.equals(7, iter.next());
        Assert.equals(50, iter.next());
        Assert.equals(50, iter.next());
        Assert.isFalse(iter.hasNext());
    }
    
    public function test__Sorting_works_with_integers_with_custom_comparator() {
    
        final array = [0, 1, 1, 1, -2, 2, 3, 50, 4, 0, 50, 7];
        final iter = array.iterator().sortedWith((a, b) -> a - b);
        Assert.equals(-2, iter.next());
        Assert.equals(0, iter.next());
        Assert.equals(0, iter.next());
        Assert.equals(1, iter.next());
        Assert.equals(1, iter.next());
        Assert.equals(1, iter.next());
        Assert.equals(2, iter.next());
        Assert.equals(3, iter.next());
        Assert.equals(4, iter.next());
        Assert.equals(7, iter.next());
        Assert.equals(50, iter.next());
        Assert.equals(50, iter.next());
        Assert.isFalse(iter.hasNext());
    }
    
    public function test__Sorting_works_when_source_is_empty() {
    
        final array: Array<Int> = [];
        final iter = array.iterator().sorted();
        Assert.isFalse(iter.hasNext());
        Assert.raises(() -> iter.next(), Exception);
    }
    
    public function test__Sorting_works_with_strings() {
    
        final array = ["foo", "bar", "baz"];
        final iter = array.iterator().sorted();
        Assert.equals("bar", iter.next());
        Assert.equals("baz", iter.next());
        Assert.equals("foo", iter.next());
        Assert.isFalse(iter.hasNext());
    }
    
    public function test__Sorting_works_with_strings_with_custom_comparator() {
    
        final array = ["foo", "bar", "baz"];
        final iter = array.iterator().sortedWith((a, b) -> if (a == b) {
            0;
        } else if (a > b) {
            -1;
        } else {
            1;
        });
        
        Assert.isTrue(iter.hasNext());
        Assert.equals("foo", iter.next());
        Assert.isTrue(iter.hasNext());
        Assert.equals("baz", iter.next());
        Assert.isTrue(iter.hasNext());
        Assert.equals("bar", iter.next());
        Assert.isFalse(iter.hasNext());
        Assert.raises(() -> iter.next(), Exception);
    }
    
    public function test__Sorting_works_with_comparable_objects() {
    
        final array = [
            new MyClass("everybody"),
            new MyClass("do"),
            new MyClass("the"),
            new MyClass("flop")
        ];
        
        final iter = array.iterator().sorted();
        Assert.equals("do", iter.next().value);
        Assert.equals("the", iter.next().value);
        Assert.equals("flop", iter.next().value);
        Assert.equals("everybody", iter.next().value);
        Assert.isFalse(iter.hasNext());
    }
    
    public function test__Sorting_by_an_int_key_works() {
    
        final array = [
            new SortFoo(123),
            new SortFoo(10),
            new SortFoo(-4),
            new SortFoo(-3),
            new SortFoo(999)
        ];
        
        final iter = array.iterator().sortedBy(a -> a.value);
        Assert.equals(-4, iter.next().value);
        Assert.equals(-3, iter.next().value);
        Assert.equals(10, iter.next().value);
        Assert.equals(123, iter.next().value);
        Assert.equals(999, iter.next().value);
        Assert.isFalse(iter.hasNext());
    }
}

class SortFoo {

    public final value: Int;
    
    public function new(bar: Int) {
        this.value = bar;
    }
}

final class MyClass {

    public final value: String;
    
    public function new(value: String) {
        this.value = value;
    }
    
    public function compareTo(other: MyClass): Int {
        return this.value.length - other.value.length;
    }
}
