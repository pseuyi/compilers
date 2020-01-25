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

data Sex
  = Male
  | Female

type Weight = Int

data BloodType =
  BloodType ABOType RhType

data ABOType
  = A
  | B
  | AB
  | O

data RhType
  = Pos
  | Neg

data Patient =
  PatientName Sex Age Height Weight BloodType

janeESmith :: Patient
janeESmith = Patient (Jane Elizabeth, Smith) Male 30 74 200 (BloodType AB Pos)

-- record
data Patient =
  Patient
    { name :: PatientName
    , sex :: Sex
    , age :: Age
    , height :: Height
    , weight :: Weight
    , bloodType :: BloodType
    } -- name jackieSmith

-- q12.1
canDonate :: Patient -> Patient -> Bool
canDonate a b = canDonateTo (bloodType a) (bloodType b)

--q12.2
patientSummary :: Patient -> String
patientSummary p = "Sex: " ++ show (sex patient) ++ "\n"
