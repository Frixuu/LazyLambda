// SPDX-License-Identifier: MIT
package;

import instrument.coverage.Coverage;
import utest.Runner;
import utest.ui.Report;

final class TestSuiteMain {

    private static function main() {
    
        final runner = new Runner();
        runner.onComplete.add(_ -> {
            Coverage.endCoverage();
        });
        
        runner.addCase(new CountTest());
        runner.addCase(new FilterTest());
        runner.addCase(new FirstTest());
        runner.addCase(new MapTest());
        
        Report.create(runner);
        runner.run();
    }
}
