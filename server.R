


#shinyserver start point----


shinyServer(function(input, output, session) {
  var_file_export_baseInfo = tsui::var_file('file_export_baseInfo')
  
  #预览功能处理 begin----                       
  shiny::observeEvent(input$btn_export_preview,
                      {
                        print('you click me ! ')
                        
                        #获取文件路径
                        file_name = var_file_export_baseInfo()          
                        print(file_name)
                        
                        #读取文件
                        data_excel <- readxl::read_excel(file_name)          
                        
                        #显示数据
                        tsui::run_dataTable2(id = 'dt_export_baseInfo',data = data_excel)           
                        
                        # 写入数据库
                        tsda::db_writeTable2(token = token,table_name = 'RDS_JH_T_receivables_his',
                                             r_object = data_excel,append = FALSE)
                        
                        # receivables_his_provisional
                        # sql_in = "INSERT INTO receivables_his  
                        #               SELECT *
                        #               from receivables_his_provisional a
                        #               where not exists
                        #               (select * from receivables_his b 
                        #                 where a.FBILLNO = b.FBILLNO 
                        #               )
                        #           "
                        # tsda::sql_gen_insert()
                        
                      })
  #预览功能处理 end----
  
  #更新功能处理 begin----
  shiny::observeEvent(input$btn_export_updateERP,
                      {
                        # 查询数据库未处理历史数据
                        # sql = "SELECT TOP (1000) [FBILLNO], [DC_I_DRAFTGRADE], [FISDO]  FROM  [receivables_his] WHERE FISDO = 0 "
                        # dataisdo0 = tsda::sql_select2(token = token,sql = sql)
                        
                        # 更新票据等级
                        sql_do_his = " 
                                    update vables 
                                    set vables.DC_I_DRAFTGRADE = his.DC_I_DRAFTGRADE
                                    from rds_vw_receivables vables
                                    inner join RDS_JH_T_receivables_his his
                                    on vables.FBILLNO = his.FBILLNO
                                    where his.fisdo = 0
                                    "   
                        tsda::sql_update2(token = token, sql_str = sql_do_his)
                        
                        # 更新历史数据fisdo = 1
                        sql_fisdo = " 
                                    update his 
                                    set his.fisdo = 1
                                    from rds_vw_receivables vables
                                    inner join RDS_JH_T_receivables_his his
                                    on vables.FBILLNO = his.FBILLNO
                                    where his.fisdo = 0
                                    "   
                        tsda::sql_update2(token = token, sql_str = sql_fisdo)
                        
                        # 查询数据库处理后历史数据
                        sql = "SELECT vables.FBILLNO, vables.DC_I_DRAFTGRADE as '应收票据汇票等级',his.DC_I_DRAFTGRADE as '需求汇票等级'
                              FROM  [rds_vw_receivables] vables
                              inner join RDS_JH_T_receivables_his his
                              on vables.FBILLNO = his.FBILLNO
                              "
                        dataisdo1 = tsda::sql_select2(token = token,sql = sql)
                        
                        # 消息框提示
                        tsui::pop_notice('更新已成功')
                        
                        # 下载数据
                        tsui::run_download_xlsx(id = 'dl_export_baseInfo',data =dataisdo1 ,filename = '测试数据.xlsx')
                      })
  #更新功能处理 end----
    
})
