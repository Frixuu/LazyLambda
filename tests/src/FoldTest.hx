// SPDX-License-Identifier: MIT
package;

import utest.Assert;
import utest.Test;

using lazylambda.Prelude;

class FoldTest extends Test {

    public function test__Strings_can_be_folded() {
    
        final src = ["he", "ll", "o ", "wor", "ld!"];
        final sb = src.iterator().fold(new StringBuf(), (b, s) -> {
            b.add(s);
            b;
        });
        
        Assert.equals("hello world!", sb.toString());
    }
}
