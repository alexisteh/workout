require 'date'
require 'byebug'

# load all ruby files in the directory "lib" and its subdirectories
# require_all 'app/models'
User.destroy_all 
Gym.destroy_all 
Sesh.destroy_all 
Workout.destroy_all 
Sessionworkout.destroy_all 


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


workout_1 = Workout.new(name: "Gentle Cardio", description: "A regular cardio exercise for hearth fitness") 
workout_2 = Workout.new(name: "Leg Day", description: "High-intensity leg workout to do at home") 
workout_3 = Workout.new(name: "Mindful Relaxation", description: "Low-intensity relaxation") 

exercise_1 = Exercise.create(name: "situps", category: "abdominal", reps: 30, sets: 3, duration: 60) 
exercise_2 = Exercise.create(name: "yoga", category: "mindfulness", sets: 1, duration: 300)  
exercise_3 = Exercise.create(name: "bicep curls", category: "arms", reps: 15, sets: 3, duration: 120)   
exercise_4 = Exercise.create(name: "push ups", category: "arms", reps: 30, sets: 5, duration: 180)
exercise_5 = Exercise.create(name: "biking", category: "cardio", sets: 1, duration: 3600)    
exercise_6 = Exercise.create(name: "stretches", category: "cool down", sets: 1, duration: 300)       
exercise_7 = Exercise.create(name: "running at 6mph", category: "cardio", sets: 1, duration: 600)       
exercise_8 = Exercise.create(name: "squats", category: "legs", reps: 20,sets: 5, duration: 1200)       
exercise_9 = Exercise.create(name: "lunges", category: "legs", reps: 10,sets: 5, duration: 600)       

workout_1.exercises << exercise_1
workout_1.exercises << exercise_5 
workout_1.exercises << exercise_6 
workout_1.save 
workout_2.exercises << exercise_7
workout_2.exercises << exercise_8
workout_2.exercises << exercise_9
workout_2.exercises << exercise_6 
workout_2.save 
workout_3.exercises << exercise_7 
workout_3.exercises << exercise_2 
workout_3.save 


workout_1.save
workout_2.save
workout_3.save



ses_wkt_1 = Sessionworkout.create(sesh_id: session_1.id, workout_id: workout_1.id)
ses_wkt_2 = Sessionworkout.create(sesh_id: session_2.id, workout_id:workout_2.id)
ses_wkt_3 = Sessionworkout.create(sesh_id: session_3.id, workout_id:workout_3.id)

byebug