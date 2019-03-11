ui <- dashboardPage(
  dashboardHeader(title = "Bandung Juara"),
  dashboardSidebar(
    sidebarMenu(
      menuItem(
        "Ujian Nasional SMP", 
        tabName = "un_smp"
      )
    )
  ),
  dashboardBody(
    shinyDashboardThemes(
      theme = "grey_light"
    ),
    tabItems(
      tabItem(
        tabName = "un_smp",
        un_smpui("un_smpui")
      )
    )
  )
)
