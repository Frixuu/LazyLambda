// SPDX-License-Identifier: MIT
package;

import haxe.Exception;
import lazylambda.ds.Pair;
import utest.Assert;
import utest.Test;

using lazylambda.Prelude;

class ZipTest extends Test {

    public function test__Zipping_stops_when_left_is_shorter() {
    
        final left = [0, 1];
        final right = ["foo", "bar", "baz"];
        
        final zip = left.iterator().zip(right.iterator());
        Assert.isTrue(zip.hasNext());
        Assert.same(new Pair(0, "foo"), zip.next());
        Assert.same(new Pair(1, "bar"), zip.next());
        Assert.isFalse(zip.hasNext());
        Assert.raises(() -> zip.next(), Exception);
    }
    
    public function test__Zipping_stops_when_right_is_shorter() {
    
        final left = [0, 1, 7, 10, 20];
        final right = ["foo", "bar", "baz"];
        
        final zip = left.iterator().zip(right.iterator());
        Assert.isTrue(zip.hasNext());
        Assert.same(new Pair(0, "foo"), zip.next());
        Assert.same(new Pair(1, "bar"), zip.next());
        Assert.same(new Pair(7, "baz"), zip.next());
        Assert.isFalse(zip.hasNext());
        Assert.raises(() -> zip.next(), Exception);
    }
    
    public function test__Zipping_stops_when_both_have_equal_length() {
    
        final left = [0];
        final right = ["foo"];
        
        final zip = left.iterator().zip(right.iterator());
        Assert.isTrue(zip.hasNext());
        Assert.same(new Pair(0, "foo"), zip.next());
        Assert.isFalse(zip.hasNext());
        Assert.raises(() -> zip.next(), Exception);
    }
    
    public function test__Zipping_handles_empty_iterators() {
    
        final left: Array<Int> = [];
        final right: Array<String> = [];
        
        final zip = left.iterator().zip(right.iterator());
        Assert.isFalse(zip.hasNext());
        Assert.raises(() -> zip.next(), Exception);
    }
}
