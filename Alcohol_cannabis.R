## ------------------------------------
if(diagnosticsFlag) unique(dat$`29091-0.0`)
dat <- dat %>%
  mutate(
    `29091-0.0` = recode(
      as.character(`29091-0.0`),
      "0" = 0,
      "1" = 1,
      "2" = 2,
      "3" = 3,
      "4" = 4,
      "-3" = NA_real_,
      .default = NA_real_
    )
  )


## ------------------------------------
if(diagnosticsFlag) unique(dat$`29092-0.0`)
dat <- dat %>%
  mutate(
    `29092-0.0` = recode(
      as.character(`29092-0.0`),
      "1" = 0,
      "2" = 1,
      "3" = 2,
      "4" = 3,
      "5" = 4,
      "-3" = NA_real_,
      .default = NA_real_
    )
  )


## ------------------------------------
if(diagnosticsFlag) unique(dat$`29093-0.0`)
dat <- dat %>%
  mutate(
    `29093-0.0` = recode(
      as.character(`29093-0.0`),
      "0" = 0,
      "2" = 1,
      "3" = 2,
      "4" = 3,
      "5" = 4,
      "-3" = NA_real_,
      .default = NA_real_
    )
  )


## ------------------------------------
if(diagnosticsFlag) unique(dat$`29094-0.0`)
dat <- dat %>%
  mutate(
    `29094-0.0` = recode(
      as.character(`29094-0.0`),
      "0" = 0,
      "2" = 1,
      "3" = 2,
      "4" = 3,
      "5" = 4,
      "-3" = NA_real_,
      .default = NA_real_
    )
  )


## ------------------------------------
if(diagnosticsFlag) unique(dat$`29095-0.0`)
dat <- dat %>%
  mutate(
    `29095-0.0` = recode(
      as.character(`29095-0.0`),
      "0" = 0,
      "2" = 1,
      "3" = 2,
      "4" = 3,
      "5" = 4,
      "-3" = NA_real_,
      .default = NA_real_
    )
  )


## ------------------------------------
if(diagnosticsFlag) unique(dat$`29096-0.0`)
dat <- dat %>%
  mutate(
    `29096-0.0` = recode(
      as.character(`29096-0.0`),
      "0" = 0,
      "2" = 1,
      "3" = 2,
      "4" = 3,
      "5" = 4,
      "-3" = NA_real_,
      .default = NA_real_
    )
  )


## ------------------------------------
if(diagnosticsFlag) unique(dat$`29097-0.0`)
dat <- dat %>%
  mutate(
    `29097-0.0` = recode(
      as.character(`29097-0.0`),
      "0" = 0,
      "2" = 1,
      "3" = 2,
      "4" = 3,
      "5" = 4,
      "-3" = NA_real_,
      .default = NA_real_
    )
  )


## ------------------------------------
if(diagnosticsFlag) unique(dat$`29098-0.0`)
dat <- dat %>%
  mutate(
    `29098-0.0` = recode(
      as.character(`29098-0.0`),
      "0" = 0,
      "2" = 1,
      "3" = 2,
      "4" = 3,
      "5" = 4,
      "-3" = NA_real_,
      .default = NA_real_
    )
  )


## ------------------------------------
if(diagnosticsFlag) unique(dat$`29099-0.0`)
dat <- dat %>%
  mutate(
    `29099-0.0` = recode(
      as.character(`29099-0.0`),
      "0" = 0,
      "1" = 2,
      "2" = 4,
      "-3" = NA_real_,
      .default = NA_real_
    )
  )


## ------------------------------------
if(diagnosticsFlag) unique(dat$`29100-0.0`)
dat <- dat %>%
  mutate(
    `29100-0.0` = recode(
      as.character(`29100-0.0`),
      "0" = 0,
      "1" = 2,
      "2" = 4,
      "-3" = NA_real_,
      .default = NA_real_
    )
  )


## ------------------------------------
dat[c(
  "29091-0.0",
  "29092-0.0",
  "29093-0.0",
  "29094-0.0",
  "29095-0.0",
  "29096-0.0",
  "29097-0.0",
  "29098-0.0",
  "29099-0.0",
  "29100-0.0"
)] <- lapply(
  dat[c(
    "29091-0.0",
    "29092-0.0",
    "29093-0.0",
    "29094-0.0",
    "29095-0.0",
    "29096-0.0",
    "29097-0.0",
    "29098-0.0",
    "29099-0.0",
    "29100-0.0"
  )],
  as.numeric
)

#Rewrites MHQ2.AUDITScore to NA if all AUDIT scores are missing/NA
dat$MHQ2.AUDITScore <- apply(
  dat[, c(
    "29091-0.0",
    "29092-0.0",
    "29093-0.0",
    "29094-0.0",
    "29095-0.0",
    "29096-0.0",
    "29097-0.0",
    "29098-0.0",
    "29099-0.0",
    "29100-0.0"
  )],
  1,
  function(row) {
    if (all(
      is.na(row)
    )
    ) {
      NA
    } else {
      sum(row,
        na.rm = TRUE
      )
    }
  }
)


## ------------------------------------
#Hazardous use
dat <- dat %>%
  mutate(
    MHQ2.AlcoholHazardousHarmfulUseCase = case_when(
      is.na(MHQ2.AUDITScore) ~ NA_real_,
      MHQ2.AUDITScore >= 8 ~ 1,
      TRUE ~ 0
    )
  )

#Harmful use
dat <- dat %>%
  mutate(
    MHQ2.AlcoholHarmfulDrinking = case_when(
      is.na(MHQ2.AUDITScore) ~ NA_real_,
      MHQ2.AUDITScore >= 16 ~ 1,
      TRUE ~ 0
    )
  )


## ------------------------------------
dat <- dat %>%
  mutate(
    MHQ2.CannabisUseEver = case_when(
      `29104-0.0` %in% c(1, 2, 3, 4) ~ 1,
      `29104-0.0` == 0 ~ 0,
      TRUE ~ NA_integer_
    )
  )


## ------------------------------------
if(diagnosticsFlag) unique(dat$`29107-0.0`)
dat <- dat %>%
  mutate(
    MHQ2.CannabisUseDaily = case_when(
      `29107-0.0` == 3 ~ 1,
      `29107-0.0` >= 0 & `29107-0.0` < 3 ~ 0,
      TRUE ~ NA_integer_
    )
  )

