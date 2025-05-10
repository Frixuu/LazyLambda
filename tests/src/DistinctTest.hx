// SPDX-License-Identifier: MIT
package;

import utest.Assert;
import utest.Test;

using lazylambda.Prelude;

class DistinctTest extends Test {

    public function test__Distinct_works_with_integers() {
    
        final array = [0, 1, 1, 1, 2, 3, 50, 4, 0, 50, 7];
        final iter = array.iterator().distinct();
        Assert.equals(0, iter.next());
        Assert.equals(1, iter.next());
        Assert.equals(2, iter.next());
        Assert.equals(3, iter.next());
        Assert.equals(50, iter.next());
        Assert.equals(4, iter.next());
        Assert.equals(7, iter.next());
        Assert.isFalse(iter.hasNext());
    }
    
    public function test__Distinct_works_with_integers_when_there_are_no_repeats() {
    
        final array = [2, 7, 10, -3, -6, -10, -12, -8, -9];
        final iter = array.iterator().distinct();
        Assert.same(array, (iter.toArray(): Null<Dynamic>));
    }
    
    public function test__Distinct_works_with_strings() {
    
        final array = ["ab", "ac", "ab", "account", "12", "null", "undefined", "undefined"];
        final iter = array.iterator().distinct();
        Assert.equals("ab", iter.next());
        Assert.equals("ac", iter.next());
        Assert.equals("account", iter.next());
        Assert.equals("12", iter.next());
        Assert.equals("null", iter.next());
        Assert.equals("undefined", iter.next());
        Assert.isFalse(iter.hasNext());
    }
    
    public function test__Distinct_works_with_comparables() {
    
        final array = [new Foo(1), new Foo(2), new Foo(1), new Foo(3), new Foo(2)];
        final iter = array.iterator().distinct();
        Assert.equals(1, iter.next().bar);
        Assert.equals(2, iter.next().bar);
        Assert.equals(3, iter.next().bar);
        Assert.isFalse(iter.hasNext());
    }
    
    public function test__Distinct_by_identity_works() {
    
        final one = new Foo(1);
        final two = new Foo(2);
        final three = new Foo(3);
        final four = new Foo(4);
        final array = [new Foo(1), new Foo(1), two, two, four, new Foo(4), three, one, one];
        final iter = array.iterator().distinctByIdentity();
        Assert.equals(1, iter.next().bar);
        Assert.equals(1, iter.next().bar);
        Assert.equals(2, iter.next().bar);
        Assert.equals(4, iter.next().bar);
        Assert.equals(4, iter.next().bar);
        Assert.equals(3, iter.next().bar);
        Assert.equals(1, iter.next().bar);
        Assert.isFalse(iter.hasNext());
    }
}

class Foo {

    public final bar: Int;
    
    public function new(bar: Int) {
        this.bar = bar;
    }
    
    public function compareTo(other: Foo): Int {
        return this.bar - other.bar;
    }
}
