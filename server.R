server <- function(input, output, session) {
  callModule(
    un_smp, 
    "un_smpui", 
    .data_path = "data/un_smp_kecamatan.rda"
  )
}
