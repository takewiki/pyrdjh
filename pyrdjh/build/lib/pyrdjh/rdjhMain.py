import pandas as pd
from pyrda.dbms.rds import RdClient


# 读取文件
def read_data(input_excel):
    df = pd.read_excel(input_excel, engine='openpyxl')
    return df


# 更新票据
def updatedraftgrade(token, df):
    jh_app = RdClient(token=token)

    df_columns = df.columns.to_list()
    # print(df_columns)
    if df_columns == ['FBILLNO', 'DC_I_DRAFTGRADE', 'FISDO']:

        fbillnumber_DC_I_DRAFTGRADE_df = df[['FBILLNO', 'DC_I_DRAFTGRADE']]

        for DC_I_DRAFTGRADE, fbillnumber_df in fbillnumber_DC_I_DRAFTGRADE_df.groupby('DC_I_DRAFTGRADE'):

            DC_I_DRAFTGRADE = str(int(DC_I_DRAFTGRADE))
            fbillnumber_list = fbillnumber_df['FBILLNO'].tolist()
            # print(fbillnumber_list)

            fbillnumbers = '('
            for fbillnumber in fbillnumber_list:
                fbillnumbers = fbillnumbers + f"'{str(fbillnumber)}'" + ','
            fbillnumbers = fbillnumbers[:-1] + ')'

            # print(fbillnumbers)

            sql = f"""
                        -- select * from T_CN_BILLRECEIVABLE

                        update T_CN_BILLRECEIVABLE set DC_I_DRAFTGRADE = {DC_I_DRAFTGRADE}

                        where fbillnumber in {fbillnumbers}
                        """
            # print(sql)
            # res = jh_app.select(sql)
            # print(res)
            jh_app.update(sql)
            return "更新完成"
    else:
        return "传入数据字段不匹配，请参考模版"


def main(input_excel, token):
    df = read_data(input_excel)
    updatedraftgrade(token, df)


if __name__ == '__main__':
    jh_test_token = 'F91CF3E3-8962-47F2-823F-C5CCAAFC66CA'
    input_excel = r"C:\Users\zzy1\Desktop\需处理历史单据清单.xlsx"
    main(input_excel, jh_test_token)
