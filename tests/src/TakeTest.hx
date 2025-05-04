// SPDX-License-Identifier: MIT
package;

import haxe.Exception;
import utest.Assert;
import utest.Test;

using lazylambda.Prelude;

class TakeTest extends Test {

    public function test__Take_stops_iteration() {
        final src = (0...99999999);
        final iter = src.take(3);
        Assert.isTrue(iter.hasNext());
        Assert.equals(0, iter.next());
        Assert.equals(1, iter.next());
        Assert.equals(2, iter.next());
        Assert.isFalse(iter.hasNext());
        Assert.raises(() -> iter.next(), Exception);
    }
    
    public function test__Take_works_when_source_has_few_items() {
        final src = (0...2);
        final iter = src.take(10);
        Assert.isTrue(iter.hasNext());
        Assert.equals(0, iter.next());
        Assert.equals(1, iter.next());
        Assert.isFalse(iter.hasNext());
        Assert.raises(() -> iter.next(), Exception);
    }
}
