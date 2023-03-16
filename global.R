## global.R ##
# 加载R包-----
enableBookmarking(store = "url")
library(shiny);
library(shinydashboard);
library(tsda);
library(tsdo);
library(tsui);

# 设置引入页-----
source('00_data.R',encoding = 'utf-8');
source('topbarMenu.R',encoding = 'utf-8');
source('sideBarSetting.R',encoding = 'utf-8');
source('01_row_body.R',encoding = 'utf-8');
source('02_column_body.R',encoding = 'utf-8');
source('03_book_body.R',encoding = 'utf-8');
source('04_series_body.R',encoding = 'utf-8');
source('05_majority_body.R',encoding = 'utf-8');
source('06_tutor_body.R',encoding = 'utf-8');
source('99_sysSetting_body.R',encoding = 'utf-8');
source('workAreaSetting.R',encoding = 'utf-8');

#测试
token = 'F91CF3E3-8962-47F2-823F-C5CCAAFC66CA'
#生产
# token = 'C0426D23-1927-4314-8736-A74B2EF7A039'






