un_smpui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      box(
        width = 12,
        height = "525px",
        plotOutput(
          ns("grafik")
        )
      ),
      box(
        width = 12,
        column(
          width = 4,
          selectInput(
            inputId = ns("tahun_awal"), 
            label = "Tahun Awal",
            choices = c(2015, 2016)
          )
        ),
        column(
          width = 4,
          selectInput(
            inputId = ns("tahun_akhir"), 
            label = "Tahun Akhir",
            choices = c(2016, 2017)
          )
        ),
        column(
          width = 4,
          selectInput(
            inputId = ns("matpel"), 
            label = "Mata Pelajaran",
            choices = c("Matematika", "IPA", "Bahasa Indonesia", "Bahasa Inggris")
          )
        )
      )
    )
  )
}

un_smp <- function(input, output, session, .data_path){
  ns <- session$ns
  
  source("helpers/grafik_un_smp.R")
  
  load(.data_path)
  
  output$grafik <- renderPlot({
    grafik_un_smp(
      .data = un_smp_kecamatan, 
      matpel = input$matpel, 
      tahun_awal = input$tahun_awal, 
      tahun_akhir = input$tahun_akhir, 
      judul = paste("Perubahan Rerata Nilai Ujian", input$matpel), 
      subjudul = paste("Nilai Ujian Nasional Tingkat SMP Kota Bandung", input$tahun_awal, "-", input$tahun_akhir))
  }, height = 500)
}
