////
////  JournalEntryCreatorView.swift
////  AllDone01
////
////  Created by 湯川隆臣 on 2023/03/25.
////
//
//import SwiftUI
//
///// Journal Entry Creation steps
//enum EntryCreationStep: Int, CaseIterable, Identifiable {
//    case moodLevel, reasons, text, images
//    var id: Int { hashValue }
//
//    /// Step question
//    var question: String {
//        switch self {
//        case .moodLevel: return "Hello, how do you feel today?"
//        case .reasons: return "What makes you feel this way?"
//        case .text: return "Write a few words or paragraphs about your day"
//        case .images: return "Do you want to attach any photos?"
//        }
//    }
//}
//
///// Journal entry creator flow
//struct JournalEntryCreatorView: View {
//
//    @EnvironmentObject var manager: DataManager
//    @Environment(\.colorScheme) var colorScheme
//    @State private var showPhotoPicker: Bool = false
//    @State private var selectedPhotoIndex: Int?
//    @State private var showDoneButton: Bool = false
//    @State private var currentStep: EntryCreationStep = .moodLevel
//    @State private var text: String = ""
//    @State private var moodLevel: MoodLevel?
//    @State private var moodText: String = ""
//    @State private var reasons: [MoodReason] = [MoodReason]()
//    @State private var images: [UIImage] = [UIImage]()
//
//    // MARK: - Main rendering function
//    var body: some View {
//        ZStack {
//            Color("Secondary").ignoresSafeArea()
//            VStack {
//                TopProgressBarView
//                switch currentStep {
//                case .moodLevel: MoodLevelSelectorView
//                case .reasons: MoodReasonsListView
//                case .text: EntryTextInputView
//                case .images: PhotosContainerView
//                }
//            }
//        }
//        /// Register for keyboard events
//        .onAppear {
//            NotificationCenter.default.addObserver(forName: UIApplication.keyboardWillShowNotification, object: nil, queue: nil) { _ in
//                DispatchQueue.main.async {
//                    self.showDoneButton = true
//                }
//            }
//            NotificationCenter.default.addObserver(forName: UIApplication.keyboardWillHideNotification, object: nil, queue: nil) { _ in
//                DispatchQueue.main.async {
//                    self.showDoneButton = false
//                }
//            }
//        }
////        /// Full modal screen flow
////        .fullScreenCover(isPresented: $showPhotoPicker) {
////            PhotoPicker { image in handleSelectedPhoto(image) }
////        }
////    }
//
//    /// Top progress bar view
//    var TopProgressBarView: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            HStack {
//                Spacer()
//                Button {
//                    if !text.isEmpty || moodLevel != nil || images.count > 0 {
//                        presentAlert(title: "Exit Flow", message: "Are you sure you want to leave this flow? You will lose your current progress", primaryAction: .Cancel, secondaryAction: .init(title: "Exit", style: .destructive, handler: { _ in
//                            manager.fullScreenMode = nil
//                        }))
//                    } else {
//                        manager.fullScreenMode = nil
//                    }
//                } label: {
//                    Image(systemName: "xmark")
//                        .font(.system(size: 20, weight: .semibold))
//                }
//            }
//            HStack(spacing: 10) {
//                ForEach(EntryCreationStep.allCases) { step in
//                    Capsule().frame(height: 6)
//                        .opacity(step.rawValue <= currentStep.rawValue ? 1 : 0.2)
//                        .onTapGesture {
//                            if step.rawValue < currentStep.rawValue {
//                                currentStep = step
//                            }
//                        }
//                }
//            }
//            Text(currentStep.question).multilineTextAlignment(.leading)
//                .font(.system(size: 28, weight: .semibold))
//        }.foregroundColor(Color("TextColor")).padding(.horizontal)
//    }
//
//    /// Next button
//    private func NextButtonView(disabled: Bool) -> some View {
//        Button {
//            if currentStep == .images {
//                if let level = moodLevel, !moodText.isEmpty, reasons.count > 0, !text.isEmpty {
//                    manager.saveEntry(text: text, moodLevel: level.rawValue, moodText: moodText, reasons: reasons, images: images)
//                    manager.fullScreenMode = nil
//                } else {
//                    presentAlert(title: "Missing Fields", message: "Make sure that you've complete all required fields")
//                }
//            } else {
//                if let index = EntryCreationStep.allCases.firstIndex(of: currentStep) {
//                    currentStep = EntryCreationStep.allCases[index+1]
//                }
//            }
//        } label: {
//            ZStack {
//                Color("TabBarColor")
//                    .cornerRadius(30).opacity(disabled ? 0.5 : 1)
//                Text(currentStep == .images ? "Submit Entry" : "Next Step")
//                    .font(.system(size: 20, weight: .semibold))
//                    .foregroundColor(Color("Secondary"))
//            }
//        }.frame(height: 60).disabled(disabled)
//    }
//
//    /// Handle selected photo
//    private func handleSelectedPhoto(_ photo: UIImage?) {
//        guard let image = photo, let currentIndex = selectedPhotoIndex else { return }
//        if images.count > currentIndex {
//            images[currentIndex] = image
//        } else {
//            images.append(image)
//        }
//    }
//
//    // MARK: - Mood Level selector
//    private var MoodLevelSelectorView: some View {
//        VStack(spacing: 20) {
//            HStack {
//                ForEach(MoodLevel.allCases) { level in
//                    Image("\(level)").opacity(moodLevel == level ? 1 : 0.3)
//                        .onTapGesture { moodLevel = level }
//                }.frame(maxWidth: .infinity)
//            }
//            ZStack {
//                Color("Primary").cornerRadius(20)
//                    .opacity(colorScheme == .dark ? 1 : 0.1)
//                if let mood = moodLevel {
//                    /// List of mood options
//                    ScrollView(.vertical, showsIndicators: false) {
//                        ForEach(0..<mood.moodOptions.count, id: \.self) { index in
//                            HStack {
//                                Text(mood.moodOptions[index])
//                                Spacer()
//                                Image(systemName: moodText == mood.moodOptions[index] ? "circle.fill" : "circle")
//                                    .font(.system(size: 20))
//                            }
//                            .padding().background(Color("ListColor"))
//                            .opacity(moodText == mood.moodOptions[index] ? 0.5 : 1)
//                            .contentShape(Rectangle()).onTapGesture {
//                                moodText = mood.moodOptions[index]
//                            }
//                        }.cornerRadius(10).padding()
//                    }
//                }
//            }
//            NextButtonView(disabled: moodLevel == nil || moodText.isEmpty)
//        }.padding(.horizontal)
//    }
//
//    // MARK: - Mood Reasons list
//    private var MoodReasonsListView: some View {
//        VStack(spacing: 20) {
//            ZStack {
//                Color("Primary").cornerRadius(20)
//                    .opacity(colorScheme == .dark ? 1 : 0.1)
//                ScrollView(.vertical, showsIndicators: false) {
//                    ForEach(MoodReason.allCases) { reason in
//                        HStack {
//                            Image("\(reason)").resizable().aspectRatio(contentMode: .fit)
//                                .frame(width: 18, height: 18, alignment: .center)
//                            Text(reason.rawValue.capitalized)
//                            Spacer()
//                            Image(systemName: reasons.contains(reason) ? "checkmark.square.fill" : "square").font(.system(size: 20))
//                        }
//                        .padding().background(Color("ListColor"))
//                        .opacity(reasons.contains(reason) ? 0.5 : 1)
//                        .contentShape(Rectangle()).onTapGesture {
//                            if reasons.contains(reason) {
//                                reasons.removeAll(where: { $0 == reason })
//                            } else {
//                                reasons.append(reason)
//                            }
//                        }
//                    }.cornerRadius(10).padding()
//                }
//            }
//            NextButtonView(disabled: reasons.count == 0)
//        }.padding(.horizontal)
//    }
//
//    // MARK: - Entry TextView
//    private var EntryTextInputView: some View {
//        VStack(spacing: 20) {
//            ZStack {
//                Color("Primary").cornerRadius(20)
//                    .opacity(colorScheme == .dark ? 1 : 0.1)
//                if #available(iOS 16.0, *) {
//                    TextEditorView.scrollContentBackground(.hidden)
//                } else {
//                    TextEditorView
//                }
//            }
//            if showDoneButton == false {
//                NextButtonView(disabled: text.trimmingCharacters(in: .whitespaces).isEmpty)
//            } else {
//                if !text.trimmingCharacters(in: .whitespaces).isEmpty {
//                    Button { hideKeyboard() } label: {
//                        Text("Done Editing").font(.system(size: 20, weight: .medium))
//                    }.padding(.bottom).foregroundColor(Color("TextColor"))
//                } else {
//                    Color.clear.frame(height: 1)
//                }
//            }
//        }.padding(.horizontal)
//    }
//
//    private var TextEditorView: some View {
//        TextEditor(text: $text).padding(.leading, -5).overlay(
//            VStack {
//                HStack {
//                    Text("Describe how was your day so far...")
//                    Spacer()
//                }
//                .opacity(text.isEmpty ? 0.5 : 0)
//                .allowsHitTesting(false)
//                Spacer()
//            }.padding(.top, 7)
//        )
//        .padding(.top, 10)
//        .foregroundColor(Color("TextColor"))
//        .padding(.horizontal, 20)
//    }
//
//    // MARK: - Photos container view
//    private var PhotosContainerView: some View {
//        let width = UIScreen.main.bounds.width-35
//        func presentPhotoPickerAlert(_ index: Int) {
//            selectedPhotoIndex = index
//            if manager.isPremiumUser {
//                showPhotoPicker = true
//            } else {
//                presentAlert(title: "Premium Feature", message: "You must upgrade to the premium version if you want to add photos to your journal check-ins")
//            }
//        }
//        let placeholder = UIImage(named: "image-placeholder")!
//        return VStack(spacing: 20) {
//            ZStack {
//                if images.count == 0 {
//                    PhotoContainer(image: placeholder, index: 0, width: width, height: width)
//                } else if images.count == 1 {
//                    HStack(spacing: 5) {
//                        PhotoContainer(image: images[0], index: 0, width: width/2-5, height: width/2-5)
//                        PhotoContainer(image: placeholder, index: 1, width: width/2-5, height: width/2-5)
//                    }
//                } else if images.count == 2 {
//                    HStack(spacing: 5) {
//                        VStack(spacing: 5) {
//                            PhotoContainer(image: images[0], index: 0, width: width/2-5, height: width/2-5)
//                            PhotoContainer(image: images[1], index: 1, width: width/2-5, height: width/2-5)
//                        }
//                        PhotoContainer(image: placeholder, index: 2, width: width/2-5, height: width-2.5)
//                    }
//                } else if images.count == 3 || images.count == 4 {
//                    HStack(spacing: 5) {
//                        VStack(spacing: 5) {
//                            PhotoContainer(image: images[0], index: 0, width: width/2-5, height: width/2-5)
//                            PhotoContainer(image: images[1], index: 1, width: width/2-5, height: width/2-5)
//                        }
//                        if images.count == 3 {
//                            VStack(spacing: 5) {
//                                PhotoContainer(image: images[2], index: 2, width: width/2-5, height: width/2-5)
//                                PhotoContainer(image: placeholder, index: 3, width: width/2-5, height: width/2-5)
//                            }
//                        } else {
//                            VStack(spacing: 5) {
//                                PhotoContainer(image: images[2], index: 2, width: width/2-5, height: width/2-5)
//                                PhotoContainer(image: images[3], index: 3, width: width/2-5, height: width/2-5)
//                            }
//                        }
//                    }
//                }
//            }.cornerRadius(20)
//            Spacer()
//            NextButtonView(disabled: false)
//        }.padding(.horizontal)
//    }
//
//    /// Photo container view
//    private func PhotoContainer(image: UIImage, index: Int, width: CGFloat, height: CGFloat) -> some View {
//        func presentPhotoPickerAlert(_ index: Int) {
//            selectedPhotoIndex = index
//            if manager.isPremiumUser {
//                showPhotoPicker = true
//            } else {
//                presentAlert(title: "Premium Feature", message: "You must upgrade to the premium version if you want to add photos to your journal check-ins")
//            }
//        }
//        return Image(uiImage: image.resizeImage(newWidth: width)).resizable().aspectRatio(contentMode: .fill)
//            .frame(width: width, height: height, alignment: .center).clipped()
//            .contentShape(Rectangle()).onTapGesture { presentPhotoPickerAlert(index) }
//    }
//}
//
//// MARK: - Preview UI
//struct JournalEntryCreatorView_Previews: PreviewProvider {
//    static var previews: some View {
//        JournalEntryCreatorView()
//            .environmentObject(DataManager(preview: true))
//            .preferredColorScheme(.dark)
//    }
//}
