menu_row <- tabItem(tabName = "row",
                    fluidRow(
                      column(width = 4,
                             box(
                               title = "应收票据历史数据处理",   
                               width = NULL,
                               solidHeader = TRUE,
                               status = "primary",
                               tsui::uiTemplate(templateName = '需处理历史单据清单模版'),                      
                               tsui::mdl_file(id = 'file_export_baseInfo', label ='应收票据需处理数据'),                                                 
                               shiny::actionButton(inputId = 'btn_export_preview' , label = '预览数据'),               
                               shiny::actionButton(inputId = 'btn_export_updateERP' , label = '更新汇票等级'),
                               tsui::mdl_download_button(id = 'dl_export_baseInfo', label = '下载处理结果')            
                             )
                             # ,
                             # box(
                             #   title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
                             #   "Box content"
                             # ),
                             # box(
                             #   title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
                             #   "Box content"
                             # )
                      ),
                      
                      # column(width = 4,
                      #        box(
                      #          title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
                      #          "Box content"
                      #        ),
                      #        box(
                      #          title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
                      #          "Box content"
                      #        ),
                      #        box(
                      #          title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
                      #          "Box content"
                      #        )
                      # ),
                      
                      column(width=8,
                             box(
                               title = "数据预览", width = NULL, solidHeader = TRUE, status = "primary",
                               tsui::mdl_dataTable(id = 'dt_export_baseInfo',label ='出口')
                             )
                             # ,
                             # box(
                             #   title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
                             #   "Box content"
                             # ),
                             # box(
                             #   title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
                             #   "Box content"
                             # )
                      )
                    )
)

