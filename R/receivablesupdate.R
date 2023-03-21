#' Title:历史票据更新，
#'
#' @param input_excel，输入文件路径
#' @param jh_test_token，口令
#'
#' @return 更新结果
#' @export
#'
#' @examples
#' rd_update_his_main(input_excel="需处理历史单据清单.xlsx",token='F91CF3E3-8962-47F2-823F-C5CCAAFC66CA')
#'
rd_update_his_main <- function(input_excel, token='F91CF3E3-8962-47F2-823F-C5CCAAFC66CA') {
  #注册python模板
  mdl <- tsda::import('rdjaourhis.jh_his')
  #调用python函数，将.替代为$
  res <- mdl$main(input_excel=input_excel, token=token)
  #返回结果
  return('更新结束')
}


