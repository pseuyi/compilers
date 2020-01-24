type PatientName = (String, String)

type Age = Int

type Height = Int

patientInfo :: PatientName -> Age -> Height -> String
patientInfo (fst, lst) age height =
  nameText ++ " " ++ ageText ++ " " ++ heightText
  where
    nameText = lname ++ ", " ++ fname
    ageText = "(" ++ show age ++ "yrs."
    heightText = show height ++ "in.)"
