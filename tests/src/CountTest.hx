// SPDX-License-Identifier: MIT
package;

import utest.Assert;
import utest.Test;

using lazylambda.Prelude;

class CountTest extends Test {

    public function test__Counting_without_a_predicate_works() {
        Assert.equals(12, (0...12).count());
    }
    
    public function test__Counting_with_a_predicate_works() {
        Assert.equals(4, (0...12).count(i -> i > 7));
    }
}
