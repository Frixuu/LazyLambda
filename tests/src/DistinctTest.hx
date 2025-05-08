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
}
