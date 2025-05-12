// SPDX-License-Identifier: MIT
package;

import utest.Assert;
import utest.Test;

using lazylambda.Prelude;

class MatchTest extends Test {

    public function test__Any_short_circuits() {
        final iter = [20, 40, 60, 31].iterator();
        Assert.isTrue(iter.anyMatch(i -> i > 50));
        Assert.equals(31, iter.next());
    }
    
    public function test__Any_fails_on_no_matches() {
        final iter = [20, 40, 60, 31].iterator();
        Assert.isFalse(iter.anyMatch(i -> i > 100));
    }
    
    public function test__Any_fails_on_empty_iterator() {
        Assert.isFalse([].iterator().anyMatch(i -> i > 50));
    }
    
    public function test__All_short_circuits() {
        final iter = [20, 40, 60, 31].iterator();
        Assert.isFalse(iter.allMatch(i -> i < 50));
        Assert.equals(31, iter.next());
    }
    
    public function test__All_works_when_every_item_matches() {
        final iter = [20, 40, 60, 31].iterator();
        Assert.isTrue(iter.allMatch(i -> i < 100));
    }
    
    public function test__All_succeeds_on_empty_iterator() {
        Assert.isTrue([].iterator().allMatch(i -> i > 50));
    }
    
    public function test__None_short_circuits() {
        final iter = [20, 40, 60, 31].iterator();
        Assert.isFalse(iter.noneMatch(i -> i > 50));
        Assert.equals(31, iter.next());
    }
    
    public function test__None_works_when_no_item_matches() {
        final iter = [20, 40, 60, 31].iterator();
        Assert.isTrue(iter.noneMatch(i -> i > 100));
    }
    
    public function test__None_succeeds_on_empty_iterator() {
        Assert.isTrue([].iterator().noneMatch(i -> i > 50));
    }
}
