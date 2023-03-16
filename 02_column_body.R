menu_column <- tabItem(tabName = "column",
                       fluidRow(
                         # column(width = 4,
                         #        box(
                         #          title = "column", width = NULL, solidHeader = TRUE, status = "primary",
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
                         # 
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
                         
                         column(width=4,
                                # box(
                                #   title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
                                #   "Box content"
                                # ),
                                # box(
                                #   title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
                                #   "Box content"
                                # ),
                                box(
                                  title = "补录业务", width = NULL, solidHeader = TRUE, status = "primary",
                                  tsui::mdl_date(id = 'd1',label = 'data'),
                                  shiny::actionButton(inputId = 'btn_export_updateERP' , label = '更新汇票等级')
                                )
                         )
                       )
)