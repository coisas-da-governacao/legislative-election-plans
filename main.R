library("dplyr")

programas_pdf <- files <- list.files(pattern = "pdf$", recursive = TRUE)
programas_raw_df <- pdf_to_text(programas_pdf)
programas_df <- mutate(programas_raw_df, programa = text_clean_up(programa))


# TM
programas_df_renamed <- transmute(programas_df, doc_id = partido, text = programa)

source <- tm::DataframeSource(programas_df_renamed)

# Corpus and some preprocessing

corpus <- tm::VCorpus(source) %>%
  tm::tm_map(tm::removeWords, tm::stopwords("portuguese"))

programas_dtm <- tm::TermDocumentMatrix(corpus)

td_idf <- tm::weightTfIdf(programas_dtm)

tm::findMostFreqTerms(td_idf, n = 20L)
