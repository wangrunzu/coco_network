clear
import delimited C:\Users\wang0040\Documents\Project\coco_network\output\failure_number_industry.csv

reg system 1.one 1.single 1.one##1.single if (two==0) & (dual==0)
outreg2 using C:\Users\wang0040\Documents\Project\coco_network\output\failure_number_industry_ouput.xls, ///
title("Table 1. One Industry Shock, 5th Percentile Regression") ///
ctitle("None") bdec(4) tdec(2) rdec(4) stats(coef tstat) ///
excel replace

reg system 1.one 1.dual 1.one##1.dual if (two==0) & (single==0)
outreg2 using C:\Users\wang0040\Documents\Project\coco_network\output\failure_number_industry_ouput.xls, ///
title("Table 1. One Industry Shock, 5th Percentile Regression") ///
ctitle("None") bdec(4) tdec(2) rdec(4) stats(coef tstat) ///
excel append

reg system 1.one 1.dual 1.one##1.dual if (two==0) & (none==0)
outreg2 using C:\Users\wang0040\Documents\Project\coco_network\output\failure_number_industry_ouput.xls, ///
title("Table 1. One Industry Shock, 5th Percentile Regression") ///
ctitle("Single") bdec(4) tdec(2) rdec(4) stats(coef tstat) ///
excel append

reg large 1.one 1.single 1.one##1.single if (two==0) & (dual==0)
outreg2 using C:\Users\wang0040\Documents\Project\coco_network\output\failure_number_industry_ouput.xls, ///
title("Table 1. One Industry Shock, 5th Percentile Regression") ///
ctitle("None") bdec(4) tdec(2) rdec(4) stats(coef tstat) ///
excel append

reg large 1.one 1.dual 1.one##1.dual if (two==0) & (single==0)
outreg2 using C:\Users\wang0040\Documents\Project\coco_network\output\failure_number_industry_ouput.xls, ///
title("Table 1. One Industry Shock, 5th Percentile Regression") ///
ctitle("None") bdec(4) tdec(2) rdec(4) stats(coef tstat) ///
excel append

reg large 1.one 1.dual 1.one##1.dual if (two==0) & (none==0)
outreg2 using C:\Users\wang0040\Documents\Project\coco_network\output\failure_number_industry_ouput.xls, ///
title("Table 1. One Industry Shock, 5th Percentile Regression") ///
ctitle("Single") bdec(4) tdec(2) rdec(4) stats(coef tstat) ///
excel append

reg medium 1.one 1.single 1.one##1.single if (two==0) & (dual==0)
outreg2 using C:\Users\wang0040\Documents\Project\coco_network\output\failure_number_industry_ouput.xls, ///
title("Table 1. One Industry Shock, 5th Percentile Regression") ///
ctitle("None") bdec(4) tdec(2) rdec(4) stats(coef tstat) ///
excel append

reg medium 1.one 1.dual 1.one##1.dual if (two==0) & (single==0)
outreg2 using C:\Users\wang0040\Documents\Project\coco_network\output\failure_number_industry_ouput.xls, ///
title("Table 1. One Industry Shock, 5th Percentile Regression") ///
ctitle("None") bdec(4) tdec(2) rdec(4) stats(coef tstat) ///
excel append

reg medium 1.one 1.dual 1.one##1.dual if (two==0) & (none==0)
outreg2 using C:\Users\wang0040\Documents\Project\coco_network\output\failure_number_industry_ouput.xls, ///
title("Table 1. One Industry Shock, 5th Percentile Regression") ///
ctitle("Single") bdec(4) tdec(2) rdec(4) stats(coef tstat) ///
excel append
