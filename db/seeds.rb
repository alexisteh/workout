require 'date'
require 'byebug'

# load all ruby files in the directory "lib" and its subdirectories
# require_all 'app/models'
User.destroy_all 
Gym.destroy_all 
Sesh.destroy_all 
Workout.destroy_all 
Sessionworkout.destroy_all 
Exercise.destroy_all 

usr_0 = User.create(name:"Blank user", password: "1", email: "blank@blank.com")
usr_1 = User.create(name:"Jeremy", password:"123", email:"jeremy123@gmail.com") 
usr_2 = User.create(name:"Garreth", password:"2423csd-f", email:"gdog123@gmail.com")
usr_3 = User.create(name:"Ari", password:"]sdf9", email:"ririme@gmail.com")
usr_4 = User.create(name:"Brody", password:"asfds-3", email:"brodykon@gmail.com")
usr_5 = User.create(name:"Tai", password:"23adsfs", email:"taimi@gmail.com")

gym_1 = Gym.create(name:"Payne Whitney Gym", address: "70 Tower Pkwy, create Haven, CT 06511", list_of_equipment: "Dumbells, Excercise bike, treadmill", user_id: usr_1.id)
gym_2 = Gym.create(name:"Payne Whitney Gym", address: "189 Elm St, create Haven, CT 06511", list_of_equipment: "Yoga ball, Dumbells, Punching bag", user_id: usr_1.id)
gym_3 = Gym.create(name:"Dorm room", address: "Yale Old Campus", list_of_equipment: "Yoga mat, Dumbells", user_id: usr_1.id)

session_1 = Sesh.create(time: DateTime.now, goals:"Get a 6 pack in 6 hours!!", user_id: usr_1.id, gym_id: gym_1.id)
session_2 = Sesh.create(time: DateTime.now, goals:"Get Shredded!!", user_id: usr_2.id, gym_id: gym_2.id)
session_3 = Sesh.create(time: DateTime.now, goals:"Stretch and loosen body!", user_id: usr_3.id, gym_id: gym_3.id)

workout_1 = Workout.create(name: "Gentle Cardio", description: "A regular cardio exercise for hearth fitness", user_id: usr_0.id) 
workout_2 = Workout.create(name: "Leg Day", description: "High-intensity leg workout to do at home", user_id: usr_0.id) 
workout_3 = Workout.create(name: "Mindful Relaxation", description: "Low-intensity relaxation", user_id: usr_0.id) 

excat_1 = Exercisecat.create(name: "Cardio")
excat_2 = Exercisecat.create(name: "Mindfulness")
excat_3 = Exercisecat.create(name: "Arms")
excat_4 = Exercisecat.create(name: "Core")
excat_5 = Exercisecat.create(name: "Legs")
excat_6 = Exercisecat.create(name: "Warm Up, Cool Down")


exercise_1 = Exercise.create(name: "situps", exercisecat_id: excat_4.id, user_id: usr_0.id) 
exercise_2 = Exercise.create(name: "yoga", exercisecat_id: excat_2.id, user_id: usr_0.id) 
exercise_3 = Exercise.create(name: "bicep curls", exercisecat_id: excat_3.id, user_id: usr_0.id)   
exercise_4 = Exercise.create(name: "push ups", exercisecat_id: excat_3.id, user_id: usr_0.id) 
exercise_5 = Exercise.create(name: "biking", exercisecat_id: excat_1.id, user_id: usr_0.id) 
exercise_6 = Exercise.create(name: "stretches", exercisecat_id: excat_6.id, user_id: usr_0.id)    
exercise_7 = Exercise.create(name: "jogging", exercisecat_id: excat_1.id, user_id: usr_0.id)    
exercise_8 = Exercise.create(name: "squats", exercisecat_id: excat_5.id, user_id: usr_0.id) 
exercise_9 = Exercise.create(name: "lunges", exercisecat_id: excat_5.id, user_id: usr_0.id)    



we_1 = Workoutexercise.create(workout_id: workout_1.id, exercise_id: exercise_1.id, reps: 10,sets: 5, duration: 180)
we_2 = Workoutexercise.create(workout_id: workout_1.id, exercise_id: exercise_5.id, reps: 1,sets: 1, duration: 1200)
we_3 = Workoutexercise.create(workout_id: workout_1.id, exercise_id: exercise_7.id, reps: 1,sets: 1, duration: 1200)
we_4 = Workoutexercise.create(workout_id: workout_1.id, exercise_id: exercise_6.id, reps: 1,sets: 1, duration: 300)

we_5 = Workoutexercise.create(workout_id: workout_2.id, exercise_id: exercise_1.id, reps: 10,sets: 5, duration: 180)
we_6 = Workoutexercise.create(workout_id: workout_2.id, exercise_id: exercise_8.id, reps: 20,sets: 5, duration: 1200)
we_7 = Workoutexercise.create(workout_id: workout_2.id, exercise_id: exercise_9.id, reps: 20,sets: 5, duration: 1500)
we_8 = Workoutexercise.create(workout_id: workout_2.id, exercise_id: exercise_6.id, reps: 1,sets: 1, duration: 300)

we_9 = Workoutexercise.create(workout_id: workout_3.id, exercise_id: exercise_6.id, reps: 1,sets: 1, duration: 300)
we_10 = Workoutexercise.create(workout_id: workout_3.id, exercise_id: exercise_2.id, reps: 1,sets: 1, duration: 1200) 

ses_wkt_1 = Sessionworkout.create(sesh_id: session_1.id, workout_id: workout_1.id) 
ses_wkt_2 = Sessionworkout.create(sesh_id: session_2.id, workout_id:workout_2.id)
ses_wkt_3 = Sessionworkout.create(sesh_id: session_3.id, workout_id:workout_3.id)

# byebug