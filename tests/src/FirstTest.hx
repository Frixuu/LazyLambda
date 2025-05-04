// SPDX-License-Identifier: MIT
package;

import haxe.Exception;
import haxe.ds.Option;
import utest.Assert;
import utest.Test;

using lazylambda.Prelude;

class FirstTest extends Test {

    public function test__First_works() {
        final src = (0...4);
        Assert.same(Some(0), src.first());
        Assert.isTrue(src.hasNext());
        Assert.equals(1, src.next());
        Assert.same(Some(3), src.first(i -> i > 2));
        Assert.isFalse(src.hasNext());
        Assert.equals(None, src.first());
        Assert.equals(None, src.first(i -> i > 2));
    }
    
    public function test__First_nullable_works() {
        final src = (0...4);
        Assert.equals(0, src.firstOrNull());
        Assert.isTrue(src.hasNext());
        Assert.equals(1, src.next());
        Assert.equals(3, src.firstOrNull(i -> i > 2));
        Assert.isFalse(src.hasNext());
        Assert.equals(null, src.firstOrNull());
        Assert.equals(null, src.firstOrNull(i -> i > 2));
    }
    
    public function test__First_throwable_works() {
        final src = (0...4);
        Assert.equals(0, src.firstOrThrow());
        Assert.isTrue(src.hasNext());
        Assert.equals(1, src.next());
        Assert.equals(3, src.firstOrThrow(i -> i > 2));
        Assert.isFalse(src.hasNext());
        Assert.raises(() -> src.firstOrThrow(), Exception);
        Assert.raises(() -> src.firstOrThrow(i -> i > 2), Exception);
    }
}
