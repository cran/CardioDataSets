## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(CardioDataSets)
library(dplyr)
library(ggplot2)

## ----CardioDataSets-datasets,echo = TRUE,message = FALSE,warning = FALSE,results = 'markup'----


view_datasets_CardioDataSets()



## ----heart-disease-plot, fig.width=6, fig.height=4, out.width="100%"----------

# Age density plot by heart disease status and sex

ggplot(heartdisease_tbl_df, aes(x = Age, fill = HeartDisease)) +
  geom_density(alpha = 0.7) +
  facet_wrap(~Sex, labeller = labeller(Sex = c("1" = "Male", "0" = "Female"))) +
  labs(title = "Age Distribution by Heart Disease Status and Sex",
       x = "Age (years)",
       y = "Density",
       caption = "Data: Heart Disease Dataset") +
  theme_minimal() +
  theme(legend.position = "bottom",
        plot.title = element_text(face = "bold", hjust = 0.5),
        strip.text = element_text(face = "bold", size = 12))


## ----cardioriskfactors-plot, fig.width=7, fig.height=5, out.width="100%"------

# Cardio risk factors: Blood pressure - cholesterol

ggplot(cardioRiskFactors_df, aes(x = ldl, y = sys, color = factor(smok))) +
  geom_point(alpha = 0.6) +
  labs(
    title = "Systolic Blood Pressure vs LDL Cholesterol",
    x = "LDL Cholesterol (mg/dL)",
    y = "Systolic Blood Pressure (mmHg)",
    color = "Smoking\nStatus (0 = No, 1 = Yes)"
  ) +
  theme_minimal()



## ----heartrate-anger-plot, fig.width=6, fig.height=4.5, out.width="90%"-------

ggplot(emotion_heartrate_df, aes(x = HR_baseline, y = HR_anger)) +
  geom_point(size = 3, alpha = 0.7, color = "#E41A1C") +  # Red points
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "gray40") +  # Reference line
  labs(title = "Heart Rate Change from Baseline to Anger State",
       x = "Baseline Heart Rate (bpm)",
       y = "Anger State Heart Rate (bpm)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

