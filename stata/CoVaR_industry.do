clear
import delimited C:\Users\wang0040\Documents\Project\coco_network\output\CoVaR_industry.csv

qreg system 1.one 1.single 1.one##1.single if (two==0) & (dual==0), quantile(0.05)
outreg2 using C:\Users\wang0040\Documents\Project\coco_network\output\CoVaR_industry_ouput.xls, ///
title("Table 1. One Industry Shock, 5th Percentile Regression") ///
ctitle("None") bdec(4) tdec(2) rdec(4) stats(coef tstat) addstat(Pseudo R2, 1-(`=e(sum_adev)'/`=e(sum_rdev)')) ///
excel replace

qreg system 1.one 1.dual 1.one##1.dual if (two==0) & (single==0), quantile(0.05)
outreg2 using C:\Users\wang0040\Documents\Project\coco_network\output\CoVaR_industry_ouput.xls, ///
title("Table 1. One Industry Shock, 5th Percentile Regression") ///
ctitle("None") bdec(4) tdec(2) rdec(4) stats(coef tstat) addstat(Pseudo R2, 1-(`=e(sum_adev)'/`=e(sum_rdev)')) ///
excel append

qreg system 1.one 1.dual 1.one##1.dual if (two==0) & (none==0), quantile(0.05)
outreg2 using C:\Users\wang0040\Documents\Project\coco_network\output\CoVaR_industry_ouput.xls, ///
title("Table 1. One Industry Shock, 5th Percentile Regression") ///
ctitle("Single") bdec(4) tdec(2) rdec(4) stats(coef tstat) addstat(Pseudo R2, 1-(`=e(sum_adev)'/`=e(sum_rdev)')) ///
excel append

qreg large 1.one 1.single 1.one##1.single if (two==0) & (dual==0), quantile(0.05)
outreg2 using C:\Users\wang0040\Documents\Project\coco_network\output\CoVaR_industry_ouput.xls, ///
title("Table 1. One Industry Shock, 5th Percentile Regression") ///
ctitle("None") bdec(4) tdec(2) rdec(4) stats(coef tstat) addstat(Pseudo R2, 1-(`=e(sum_adev)'/`=e(sum_rdev)')) ///
excel append

qreg large 1.one 1.dual 1.one##1.dual if (two==0) & (single==0), quantile(0.05)
outreg2 using C:\Users\wang0040\Documents\Project\coco_network\output\CoVaR_industry_ouput.xls, ///
title("Table 1. One Industry Shock, 5th Percentile Regression") ///
ctitle("None") bdec(4) tdec(2) rdec(4) stats(coef tstat) addstat(Pseudo R2, 1-(`=e(sum_adev)'/`=e(sum_rdev)')) ///
excel append

qreg large 1.one 1.dual 1.one##1.dual if (two==0) & (none==0), quantile(0.05)
outreg2 using C:\Users\wang0040\Documents\Project\coco_network\output\CoVaR_industry_ouput.xls, ///
title("Table 1. One Industry Shock, 5th Percentile Regression") ///
ctitle("Single") bdec(4) tdec(2) rdec(4) stats(coef tstat) addstat(Pseudo R2, 1-(`=e(sum_adev)'/`=e(sum_rdev)')) ///
excel append

qreg medium 1.one 1.single 1.one##1.single if (two==0) & (dual==0), quantile(0.05)
outreg2 using C:\Users\wang0040\Documents\Project\coco_network\output\CoVaR_industry_ouput.xls, ///
title("Table 1. One Industry Shock, 5th Percentile Regression") ///
ctitle("None") bdec(4) tdec(2) rdec(4) stats(coef tstat) addstat(Pseudo R2, 1-(`=e(sum_adev)'/`=e(sum_rdev)')) ///
excel append

qreg medium 1.one 1.dual 1.one##1.dual if (two==0) & (single==0), quantile(0.05)
outreg2 using C:\Users\wang0040\Documents\Project\coco_network\output\CoVaR_industry_ouput.xls, ///
title("Table 1. One Industry Shock, 5th Percentile Regression") ///
ctitle("None") bdec(4) tdec(2) rdec(4) stats(coef tstat) addstat(Pseudo R2, 1-(`=e(sum_adev)'/`=e(sum_rdev)')) ///
excel append

qreg medium 1.one 1.dual 1.one##1.dual if (two==0) & (none==0), quantile(0.05)
outreg2 using C:\Users\wang0040\Documents\Project\coco_network\output\CoVaR_industry_ouput.xls, ///
title("Table 1. One Industry Shock, 5th Percentile Regression") ///
ctitle("Single") bdec(4) tdec(2) rdec(4) stats(coef tstat) addstat(Pseudo R2, 1-(`=e(sum_adev)'/`=e(sum_rdev)')) ///
excel append

// qreg system 1.two 1.single 1.two##1.single if (one==0) & (dual==0), quantile(0.05)
//
// qreg system 1.two 1.dual 1.two##1.dual if (one==0) & (single==0), quantile(0.05)
//
// qreg system 1.two 1.dual 1.two##1.dual if (one==0) & (none==0), quantile(0.05)
