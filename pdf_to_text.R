programas_pdf <- files <- list.files(pattern = "pdf$", recursive = TRUE)
programas_2019 <- purrr::map(programas_pdf, pdftools::pdf_text)
