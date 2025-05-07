// SPDX-License-Identifier: MIT
package;

import haxe.Exception;
import haxe.ds.Option;
import utest.Assert;
import utest.Test;

using lazylambda.Prelude;

class ReduceTest extends Test {

    public function test__Strings_can_be_reduced() {
        final src: Array<String> = ["he", "ll", "o ", "wor", "ld!"];
        Assert.same(Some("hello world!"), src.iterator().reduce((a, s) -> a + s));
        Assert.equals("hello world!", src.iterator().reduceOrNull((a, s) -> a + s));
        Assert.equals("hello world!", src.iterator().reduceOrThrow((a, s) -> a + s));
    }
    
    public function test__Empty_iterator_is_treated_appropriately() {
        final src: Array<String> = [];
        Assert.equals(None, src.iterator().reduce((a, s) -> a + s));
        Assert.equals(null, src.iterator().reduceOrNull((a, s) -> a + s));
        Assert.raises(() -> src.iterator().reduceOrThrow((a, s) -> a + s), Exception);
    }
}
