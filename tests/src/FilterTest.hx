// SPDX-License-Identifier: MIT
package;

import Math.NaN;
import haxe.Exception;
import haxe.ds.Option;
import utest.Assert;
import utest.Test;

using TestUtils;
using lazylambda.Prelude;

class FilterTest extends Test {

    public function spec__Predicate_is_applied_to_each_item() {
        final iter = (1...6).filter(i -> i.isLessThan(4));
        Assert.equals(1, iter.next());
        Assert.equals(2, iter.next());
        Assert.equals(3, iter.next());
        Assert.isFalse(iter.hasNext());
    }
    
    public function spec__Loop_does_not_iterate_when_iterator_source_is_empty() {
        final arr: Array<Int> = [];
        final iter = arr.iterator().filter(i -> i.isGreaterThan(0));
        for (_item in iter) {
            Assert.fail("Should not iterate");
        }
        Assert.pass();
    }
    
    public function spec__Loop_does_not_iterate_when_no_items_match_the_predicate() {
        final iter = (1...10).filter(i -> i.isGreaterThan(10));
        for (_item in iter) {
            Assert.fail("Should not iterate");
        }
        Assert.pass();
    }
    
    public function spec__Exception_is_thrown_when_getting_an_item_from_an_empty_iterator() {
        final arr: Array<Int> = [];
        final iter = arr.iterator().filter(i -> i.isGreaterThan(0));
        Assert.raises(() -> iter.next(), Exception);
    }
    
    public function spec__Iterator_works_with_a_single_item_source() {
        final arr: Array<Int> = [1];
        final iter = arr.iterator().filter(i -> i.isLessThan(10));
        for (item in iter) {
            Assert.equals(1, item);
        }
    }
    
    public function spec__Nulls_are_filtered_out() {
        final arr: Array<Null<String>> = ["hello", null, "world", null, null];
        final iter = arr.iterator().filterNonNull();
        Assert.equals("hello", iter.next());
        Assert.equals("world", iter.next());
        Assert.isFalse(iter.hasNext());
    }
    
    public function spec__Nones_are_filtered_out() {
        final arr: Array<Option<Float>> = [None, Some(1.0), Some(-7.2), None, Some(NaN)];
        final iter = arr.iterator().filterSome();
        Assert.equals(1.0, iter.next());
        Assert.equals(-7.2, iter.next());
        Assert.isTrue(Math.isNaN(iter.next()));
        Assert.isFalse(iter.hasNext());
    }
}
