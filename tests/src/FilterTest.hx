// SPDX-License-Identifier: MIT
package;

import Math.NaN;
import haxe.Constraints.IMap;
import haxe.Exception;
import haxe.ds.IntMap;
import haxe.ds.Option;
import haxe.ds.StringMap;
import utest.Assert;
import utest.Test;

using lazylambda.Prelude;

class FilterTest extends Test {

    public function test__Predicate_is_applied_to_each_item() {
        final iter = (1...6).filter(i -> i < 4);
        Assert.equals(1, iter.next());
        Assert.equals(2, iter.next());
        Assert.equals(3, iter.next());
        Assert.isFalse(iter.hasNext());
    }
    
    public function test__Loop_does_not_iterate_when_iterator_source_is_empty() {
        final arr: Array<Int> = [];
        final iter = arr.iterator().filter(i -> i > 0);
        for (_item in iter) {
            Assert.fail("Should not iterate");
        }
        Assert.pass();
    }
    
    public function test__Loop_does_not_iterate_when_no_items_match_the_predicate() {
        final iter = (1...10).filter(i -> i > 10);
        for (_item in iter) {
            Assert.fail("Should not iterate");
        }
        Assert.pass();
    }
    
    public function test__Exception_is_thrown_when_getting_an_item_from_an_empty_iterator() {
        final arr: Array<Int> = [];
        final iter = arr.iterator().filter(i -> i > 0);
        Assert.raises(() -> iter.next(), Exception);
    }
    
    public function test__Iterator_works_with_a_single_item_source() {
        final arr: Array<Int> = [1];
        final iter = arr.iterator().filter(i -> i < 10);
        for (item in iter) {
            Assert.equals(1, item);
        }
    }
    
    public function test__Nulls_are_filtered_out() {
        final arr: Array<Null<String>> = ["hello", null, "world", null, null];
        final iter = arr.iterator().filterNonNull();
        Assert.isTrue(iter.hasNext());
        Assert.equals("hello", iter.next());
        Assert.equals("world", iter.next());
        Assert.isFalse(iter.hasNext());
    }
    
    public function test__Null_filter_behaves_predictably_when_no_items_match() {
        final arr: Array<Null<Any>> = [null, null];
        final iter = arr.iterator().filterNonNull();
        Assert.isFalse(iter.hasNext());
        Assert.raises(() -> iter.next(), Exception);
    }
    
    public function test__Nones_are_filtered_out() {
        final arr: Array<Option<Float>> = [None, Some(1.0), Some(-7.2), None, Some(NaN)];
        final iter = arr.iterator().filterSome();
        Assert.equals(1.0, iter.next());
        Assert.equals(-7.2, iter.next());
        Assert.isTrue(iter.hasNext());
        Assert.isTrue(Math.isNaN(iter.next()));
        Assert.isFalse(iter.hasNext());
    }
    
    public function test__Option_filter_behaves_predictably_when_no_items_match() {
        final arr: Array<Option<Any>> = [None];
        final iter = arr.iterator().filterSome();
        Assert.isFalse(iter.hasNext());
        Assert.raises(() -> iter.next(), Exception);
    }
    
    public function test__Type_filter_works_with_integers() {
        final arr: Array<Any> = ["hello", 1, 2, false, 5.6, {}, [7]];
        final iter = arr.iterator().filterIs(Int);
        Assert.equals(1, iter.next());
        Assert.equals(2, iter.next());
        Assert.isFalse(iter.hasNext());
    }
    
    public function test__Type_filter_works_with_booleans() {
        final arr: Array<Any> = ["hello", 1, 2, false, 5.6, {}, [7]];
        final iter: Iterator<Bool> = arr.iterator().filterIs(Bool);
        Assert.equals(false, iter.next());
        Assert.isFalse(iter.hasNext());
    }
    
    public function test__Type_filter_works_with_strings() {
        final arr: Array<Any> = ["hello", 1, 2, false, 5.6, {}, [7]];
        final iter = arr.iterator().filterIs(String);
        Assert.isTrue(iter.hasNext());
        Assert.equals("hello", iter.next());
        Assert.isFalse(iter.hasNext());
    }
    
    public function test__Type_filter_works_with_arrays() {
        final arr: Array<Any> = ["hello", 1, 2, false, 5.6, {}, [7]];
        final iter = arr.iterator().filterIs(Array);
        final item = iter.next();
        Assert.equals(1, item.length);
        Assert.equals(7, item[0]);
        Assert.isFalse(iter.hasNext());
    }
    
    public function test__Type_filter_works_with_interfaces() {
        final arr: Array<Any> = [new StringMap(), new IntMap(), new StringBuf(), ["foo" => "bar"]];
        final iter = arr.iterator().filterIs(IMap);
        Assert.equals(arr[0], iter.next());
        Assert.equals(arr[1], iter.next());
        Assert.equals(arr[3], iter.next());
        Assert.isFalse(iter.hasNext());
    }
    
    public function test__Type_filter_works_with_enums() {
        final arr: Array<Any> = ["hello", 1, Some(4), new StringBuf(), ["foo" => "bar"]];
        final iter = arr.iterator().filterIs(Option);
        Assert.same(Some(4), iter.next());
        Assert.isFalse(iter.hasNext());
    }
    
    public function test__Type_filter_behaves_predictably_when_no_items_match() {
        final arr: Array<Any> = ["hello"];
        final iter = arr.iterator().filterIs(Int);
        Assert.isFalse(iter.hasNext());
        Assert.raises(() -> iter.next(), Exception);
    }
}
