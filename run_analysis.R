library(dplyr)


# Lade Trainings- und Testdaten
train_x <- read.table("C:\\Users\\PD\\Downloads\\UCI HAR Dataset\\train\\X_train.txt")
train_y <- read.table("C:\\Users\\PD\\Downloads\\UCI HAR Dataset\\train\\y_train.txt")
train_subject <- read.table("C:\\Users\\PD\\Downloads\\UCI HAR Dataset\\train\\subject_train.txt")

test_x <- read.table("C:\\Users\\PD\\Downloads\\UCI HAR Dataset\\test\\y_test.txt")
test_subject <- read.table("C:\\Users\\PD\\Downloads\\UCI HAR Dataset\\test\\subject_test.txt")

# Vereine die Trainings- und Testdaten zu einem Datensatz
data_x <- rbind(train_x, test_x)
data_y <- rbind(train_y, test_y)
data_subject <- rbind(train_subject, test_subject)

# Lade die Feature-Namen und extrahiere nur die Messungen des Mittelwerts und der Standardabweichung
features <- read.table("C:\\Users\\UPD\\Downloads\\UCI HAR Dataset\\features.txt")
mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
data_x <- data_x[, mean_std_features]

# Benenne die Variablen in data_x mit den Feature-Namen
names(data_x) <- features[mean_std_features, 2]

# Lade die Aktivitätsnamen und wende sie an
activities <- read.table("C:\\Users\\PD\\Downloads\\UCI HAR Dataset\\activity_labels.txt")
data_y[, 1] <- activities[data_y[, 1], 2]
names(data_y) <- "activity"

# Benenne die Subjektdaten
names(data_subject) <- "subject"

# Vereine alle Daten zu einem vollständigen Datensatz
complete_data <- cbind(data_subject, data_y, data_x)

# Erstelle einen zweiten, unabhängigen, ordentlichen Datensatz mit dem Durchschnitt jeder Variable für jede Aktivität und jedes Subjekt
tidy_data <- complete_data %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean = ~ mean(.)))

# Speichere den ordentlichen Datensatz in einer Datei
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

# Bestätigungsmeldung
message("run_analysis.R wurde erfolgreich ausgeführt und tidy_data.txt wurde erstellt.")
