library(bandungjuara)
library(tidyverse)

un_smp <-
  cari(kata_kunci = "smp") %>%
  filter(
    nama %in% str_subset(nama, pattern = "Ujian Nasional")
  ) %>%
  impor() %>%
  bind_rows(.id = "nama_dataset")

glimpse(un_smp)

un_smp_kecamatan <-
  un_smp %>%
  group_by(nama_kecamatan, tahun) %>%
  summarise_at(
    vars(nilai_rerata_bahasa_indonesia:nilai_rerata_ipa),
    ~ mean(.x)
  ) %>%
  ungroup()

glimpse(un_smp_kecamatan)

save(un_smp_kecamatan, file = "data/un_smp_kecamatan.rda", compress = "bzip2", compression_level = 9)
