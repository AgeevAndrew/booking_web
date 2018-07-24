namespace :db do
  namespace :company_seed do
    task_names = []
    Dir[File.join(Rails.root, 'db', 'companies_seeds', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb').intern
      task_names << task_name
      desc "Add company #{task_name.to_s}"
      task task_name => :environment do
        load(filename) if File.exist?(filename)
      end
    end

    desc "Seed all company from scratch"
    task :all do
      Rake::Task["db:seed"].invoke
      task_names.each do |company|
        Rake::Task["db:company_seed:#{company}"].invoke
      end
    end
  end
end
