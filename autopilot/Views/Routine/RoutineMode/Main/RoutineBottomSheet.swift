//
//  RoutineBottomSheet.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/31/22.
//

import SwiftUI

struct RoutineBottomSheet: View {
    @Binding var selectedTab: Int
    @Binding var activityIndex: Int
    @ObservedObject var viewModel: Routine
    
    var body: some View    {
        VStack {
            Handle()
                .padding(.bottom, 4)
            VStack {
                HStack {
                    Spacer()
                    Text("Left Arm")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 4)

                HStack {
                    Spacer()
                    Text(viewModel.routine[activityIndex].name ?? "Rest")
                        .foregroundColor(.black)
                        .font(.body)
                        
                    Spacer()
                }
                .padding(.horizontal, 30)
                HStack {
                    Button(action: {}) {
                        Image(systemName: "list.bullet")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 14, height: 14)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    VStack {
                        Text("0:30")
                            .offset(y: 5)
                        ProgressView(value: 50, total: 100)
                            .frame(width: UIScreen.main.bounds.width * 0.50)
                    }
                    
                    Spacer()
                    Button(action: {
                        self.activityIndex += 1
                        self.selectedTab += 1
                    }) {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.green)
                    }
                }
                .padding(.horizontal, 30)
            }
            .padding(.bottom, 40)
            
            // Everything under here, the user has to drag the bottom sheet up to see.
            Divider()
                .padding(.horizontal, 30)
            
            VStack {
                HStack {
                        Button(action: {}) {
                            VStack {
                                Image(systemName: "square.stack.3d.up")
                                Text("Report")
                                Text("Reps")

                            }
                        }
                    Spacer()
                        Button(action: {}) {
                            VStack {
                                Image(systemName: "arrow.uturn.backward.circle.fill")
                                Text("Restart")
                                Text("Set")

                            }
                        }
                    Spacer()
                        Button(action: {}) {
                            VStack {
                                Image(systemName: "speaker.wave.2.fill")
                                Text("Hear")
                                Text("Guide")

                            }
                        }
                    Spacer()
                        Button(action: {}) {
                            VStack {
                                Image(systemName: "clock.fill")
                                Text("Activity")
                                Text("History")

                            }
                        }
                       

                    
                }
                .padding(.horizontal, 34)
                .padding(.vertical, 16)
            }
            
        }
        .background(Color(.systemGray6))
        .cornerRadius(15)
    }
}

struct RoutineBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        RoutineBottomSheet(selectedTab: .constant(0), activityIndex: .constant(0), viewModel: Routine())
    }
}
