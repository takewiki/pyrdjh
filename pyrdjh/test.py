from pyrdjh import rdjhMain

jh_test_token = 'F91CF3E3-8962-47F2-823F-C5CCAAFC66CA'
input_excel = r"C:\Users\zzy1\Desktop\需处理历史单据清单.xlsx"

# 读取文件，更新汇票等级
rdjhMain.main(input_excel=input_excel, token=jh_test_token)

# # 读取数据，输出datafram
# df = rdjhMain.ReadData(input_excel=input_excel)
#
# # 更新汇票等级
# rdjhMain.UpdateDraftGrade(token=jh_test_token, df=df)


