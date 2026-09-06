import 'package:flutter/material.dart';

void main() {
  runApp(const GameClearApp());
}

class GameClearApp extends StatelessWidget {
  const GameClearApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '오늘은 엔딩보자',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B1020),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B5CF6),
          brightness: Brightness.dark,
        ),
      ),
      home: const MainScreen(),
    );
  }
}

// ============================================================
// MAIN
// ============================================================

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final pages = const [
    HomePage(),
    PlaceholderPage(title: '내 게임'),
    PlaceholderPage(title: '통계'),
    PlaceholderPage(title: '커뮤니티'),
    PlaceholderPage(title: '프로필'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: pages[currentIndex],
      ),
      bottomNavigationBar: NavigationBar(
        height: 72,
        backgroundColor: const Color(0xFF11182C),
        indicatorColor: const Color(0x332F1B66),
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: '홈',
          ),
          NavigationDestination(
            icon: Icon(Icons.sports_esports_outlined),
            selectedIcon: Icon(Icons.sports_esports),
            label: '내 게임',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: '통계',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: '커뮤니티',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: '프로필',
          ),
        ],
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

// ============================================================
// HOME
// ============================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 30),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              const [
                HomeHeader(),
                SizedBox(height: 18),
                ClearSummaryCard(),
                SizedBox(height: 16),
                ActivityCard(),
                SizedBox(height: 16),
                StatisticsSection(),
                SizedBox(height: 26),
                RecentGamesSection(),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// HEADER
// ============================================================

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              const Icon(
                Icons.sports_esports_rounded,
                color: Color(0xFFB9C7FF),
                size: 28,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  '오늘은 엔딩보자',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1,
                  ),
                ),
              ),
              const SizedBox(width: 3),
              const Text(
                '✦',
                style: TextStyle(
                  color: Color(0xFFFFA86B),
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            size: 25,
            color: Color(0xFFD8DDF2),
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),
          onPressed: () {},
          icon: const Icon(
            Icons.settings_outlined,
            size: 24,
            color: Color(0xFFD8DDF2),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// CLEAR SUMMARY
// ============================================================

class ClearSummaryCard extends StatelessWidget {
  const ClearSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0x332D3A63),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1B2440),
            Color(0xFF151D35),
          ],
        ),
      ),
      child: Row(
        children: [
          const ProgressCircle(),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '조금만 더!',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  '지금까지 32개의 게임을\n클리어했어요.',
                  style: TextStyle(
                    color: Color(0xFFADB6D2),
                    fontSize: 12,
                    height: 1.55,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '오늘도 한 개 더!',
                  style: TextStyle(
                    color: Color(0xFFADB6D2),
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          const Mascot(),
        ],
      ),
    );
  }
}

class ProgressCircle extends StatelessWidget {
  const ProgressCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 94,
            height: 94,
            child: CircularProgressIndicator(
              value: 32 / 50,
              strokeWidth: 8,
              backgroundColor: const Color(0xFF293252),
              valueColor: const AlwaysStoppedAnimation(
                Color(0xFF9067F7),
              ),
            ),
          ),
          const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '32 / 50',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 1),
              Text(
                '깬 게임',
                style: TextStyle(
                  color: Color(0xFF929DBB),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Mascot extends StatelessWidget {
  const Mascot({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 48,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '✦',
            style: TextStyle(
              color: Color(0xFFFFD76A),
              fontSize: 12,
            ),
          ),
          Text(
            '🎧',
            style: TextStyle(fontSize: 26),
          ),
          Text(
            '🐱',
            style: TextStyle(fontSize: 28),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// ACTIVITY
// ============================================================

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  static const List<List<int>> activityData = [
    [0, 0, 1, 0, 0, 2, 1],
    [1, 3, 2, 1, 2, 3, 1],
    [0, 2, 1, 2, 0, 2, 3],
    [2, 3, 2, 1, 3, 2, 2],
    [0, 1, 3, 2, 2, 3, 3],
  ];

  static const weekdays = ['월', '화', '수', '목', '금', '토', '일'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF121A30),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color(0x222D3A63),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.local_fire_department_rounded,
                color: Color(0xFFFFC84A),
                size: 20,
              ),
              const SizedBox(width: 7),
              const Text(
                '게임 플레이 기록',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              Text(
                '9월',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.45),
                  fontSize: 11,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 월 ~ 일
          Row(
            children: weekdays.map((day) {
              return Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white.withOpacity(0.45),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 8),

          // 잔디
          Column(
            children: activityData.map((week) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: week.map((level) {
                    return Expanded(
                      child: Center(
                        child: _ActivityCell(level: level),
                      ),
                    );
                  }).toList(),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 10),

          // 범례
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '적음',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
              const SizedBox(width: 5),
              const _ActivityCell(level: 0, size: 11),
              const SizedBox(width: 3),
              const _ActivityCell(level: 1, size: 11),
              const SizedBox(width: 3),
              const _ActivityCell(level: 2, size: 11),
              const SizedBox(width: 3),
              const _ActivityCell(level: 3, size: 11),
              const SizedBox(width: 5),
              Text(
                '많음',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              const _ActivityStat(
                value: '42h 18m',
                label: '플레이 시간',
              ),
              const SizedBox(width: 24),
              const _ActivityStat(
                value: '12개',
                label: '플레이한 게임',
              ),
              const SizedBox(width: 24),
              const _ActivityStat(
                value: '3개',
                label: '클리어',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActivityCell extends StatelessWidget {
  final int level;
  final double size;

  const _ActivityCell({
    required this.level,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    final colors = [
      const Color(0xFF1B2338),
      const Color(0xFF31513F),
      const Color(0xFF4D815C),
      const Color(0xFF72B47C),
    ];

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: colors[level],
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class _ActivityStat extends StatelessWidget {
  final String value;
  final String label;

  const _ActivityStat({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Colors.white.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}

class ActivityTitle extends StatelessWidget {
  const ActivityTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          '2026년 9월',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(width: 4),
        IconButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(
            minWidth: 28,
            minHeight: 28,
          ),
          icon: const Icon(
            Icons.chevron_left,
            size: 21,
            color: Color(0xFF8791B2),
          ),
        ),
        IconButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(
            minWidth: 28,
            minHeight: 28,
          ),
          icon: const Icon(
            Icons.chevron_right,
            size: 21,
            color: Color(0xFF8791B2),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// HEATMAP
// ============================================================

class ActivityHeatmap extends StatelessWidget {
  const ActivityHeatmap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ActivityLegend(),
        const SizedBox(height: 13),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WeekdayLabels(),
              const SizedBox(width: 8),
              Row(
                children: _activityData.map((week) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Column(
                      children: week.map((value) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: HeatCell(value: value),
                        );
                      }).toList(),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ActivityLegend extends StatelessWidget {
  const ActivityLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 6,
      children: const [
        LegendItem(
          color: Color(0xFF252D49),
          text: '안 함',
        ),
        LegendItem(
          color: Color(0xFF555589),
          text: '1시간 미만',
        ),
        LegendItem(
          color: Color(0xFF8063D0),
          text: '1~3시간',
        ),
        LegendItem(
          color: Color(0xFFA052FF),
          text: '3시간 이상',
        ),
      ],
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF8994B5),
            fontSize: 9,
          ),
        ),
      ],
    );
  }
}

class WeekdayLabels extends StatelessWidget {
  const WeekdayLabels({super.key});

  @override
  Widget build(BuildContext context) {
    const days = [
      '월',
      '화',
      '수',
      '목',
      '금',
      '토',
      '일',
    ];

    return Column(
      children: days.map((day) {
        return SizedBox(
          width: 18,
          height: 17,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              day,
              style: const TextStyle(
                color: Color(0xFF8994B5),
                fontSize: 9,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class HeatCell extends StatelessWidget {
  final int value;

  const HeatCell({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    const colors = [
      Color(0xFF252D49),
      Color(0xFF555589),
      Color(0xFF8063D0),
      Color(0xFFA052FF),
    ];

    return Container(
      width: 17,
      height: 17,
      decoration: BoxDecoration(
        color: colors[value],
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class ActivityStats extends StatelessWidget {
  const ActivityStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: ActivityStat(
            icon: Icons.access_time,
            title: '플레이 시간',
            value: '42h 18m',
          ),
        ),
        Expanded(
          child: ActivityStat(
            icon: Icons.sports_esports,
            title: '플레이한 게임',
            value: '12개',
          ),
        ),
        Expanded(
          child: ActivityStat(
            icon: Icons.check_circle_outline,
            title: '클리어',
            value: '3개',
          ),
        ),
      ],
    );
  }
}

class ActivityStat extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ActivityStat({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 21,
          color: const Color(0xFFBBC8FF),
        ),
        const SizedBox(height: 7),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Color(0xFF8994B5),
            fontSize: 9,
          ),
        ),
        const SizedBox(height: 3),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// STATISTICS
// ============================================================

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      mainAxisExtent: 155,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        MostPlayedCard(),
        RecentlyClearedCard(),
        AveragePlayCard(),
        LongestGameCard(),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget content;

  const StatCard({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF121A30),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color(0x222D3A63),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFFFFC84A),
            size: 22,
          ),
          const SizedBox(height: 9),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 9),
          Flexible(
            child: content,
          ),
        ],
      ),
    );
  }
}

class MostPlayedCard extends StatelessWidget {
  const MostPlayedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return StatCard(
      icon: Icons.local_fire_department,
      title: '가장 많이 한 게임',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Elden Ring',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 3),
          Text(
            '21시간',
            style: TextStyle(
              color: Color(0xFFA8B1CD),
              fontSize: 11,
            ),
          ),
          Spacer(),
          ProgressBar(value: 0.83),
        ],
      ),
    );
  }
}

class RecentlyClearedCard extends StatelessWidget {
  const RecentlyClearedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return StatCard(
      icon: Icons.emoji_events,
      title: '가장 최근 클리어',
      content: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: GameCover(
              imageUrl: GameData.hadesImage,
              width: 37,
              height: 47,
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hades',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '2026.09.02',
                  style: TextStyle(
                    color: Color(0xFFA8B1CD),
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AveragePlayCard extends StatelessWidget {
  const AveragePlayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return StatCard(
      icon: Icons.access_time,
      title: '평균 플레이 시간',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              '6h 12m',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(height: 3),
          Text(
            '클리어한 게임 기준',
            style: TextStyle(
              color: Color(0xFF8C97B5),
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }
}

class LongestGameCard extends StatelessWidget {
  const LongestGameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return StatCard(
      icon: Icons.star,
      title: '가장 오래 걸린 게임',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Elden Ring',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 3),
          Text(
            '89일',
            style: TextStyle(
              color: Color(0xFFA8B1CD),
              fontSize: 11,
            ),
          ),
          Spacer(),
          ProgressBar(value: 0.78),
        ],
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final double value;

  const ProgressBar({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: LinearProgressIndicator(
        value: value,
        minHeight: 6,
        backgroundColor: const Color(0xFF293252),
        valueColor: const AlwaysStoppedAnimation(
          Color(0xFF8658EF),
        ),
      ),
    );
  }
}

// ============================================================
// RECENT GAMES
// ============================================================

class RecentGamesSection extends StatelessWidget {
  const RecentGamesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Row(
          children: [
            Text(
              '최근 플레이한 게임',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Color(0xFF8994B5),
            ),
            Spacer(),
            Text(
              '전체 보기',
              style: TextStyle(
                color: Color(0xFF5EA7FF),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        RecentGamesList(),
      ],
    );
  }
}

class RecentGamesList extends StatelessWidget {
  const RecentGamesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 218,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: GameData.games.length,
        separatorBuilder: (_, __) => const SizedBox(width: 9),
        itemBuilder: (context, index) {
          return RecentGameCard(
            game: GameData.games[index],
          );
        },
      ),
    );
  }
}

class RecentGameCard extends StatelessWidget {
  final GameData game;

  const RecentGameCard({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 132,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: const Color(0xFF151D35),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0x222D3A63),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: GameCover(
                  imageUrl: game.imageUrl,
                  width: 116,
                  height: 100,
                ),
              ),
              Positioned(
                top: 6,
                left: 6,
                child: StatusBadge(
                  text: game.status,
                  completed: game.completed,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            game.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            game.info,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF929DBA),
              fontSize: 9,
            ),
          ),
          const SizedBox(height: 7),
          if (!game.completed)
            ProgressBar(value: game.progress)
          else
            const SizedBox(height: 6),
        ],
      ),
    );
  }
}

class StatusBadge extends StatelessWidget {
  final String text;
  final bool completed;

  const StatusBadge({
    super.key,
    required this.text,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: completed
            ? const Color(0xDD3BDB83)
            : const Color(0xDD6372D8),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 8,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

// ============================================================
// IMAGE
// ============================================================

class GameCover extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const GameCover({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) {
        return Container(
          width: width,
          height: height,
          color: const Color(0xFF252D49),
          child: const Icon(
            Icons.sports_esports,
            color: Color(0xFF858FB0),
          ),
        );
      },
    );
  }
}

// ============================================================
// DATA
// ============================================================

class GameData {
  final String title;
  final String imageUrl;
  final String status;
  final String info;
  final bool completed;
  final double progress;

  const GameData({
    required this.title,
    required this.imageUrl,
    required this.status,
    required this.info,
    required this.completed,
    required this.progress,
  });

  static const String persona5Image =
      'https://cdn.cloudflare.steamstatic.com/steam/apps/1687950/header.jpg';

  static const String insideImage =
      'https://cdn.cloudflare.steamstatic.com/steam/apps/304430/header.jpg';

  static const String hadesImage =
      'https://cdn.cloudflare.steamstatic.com/steam/apps/1145360/header.jpg';

  static const String stardewImage =
      'https://cdn.cloudflare.steamstatic.com/steam/apps/413150/header.jpg';

  static const String celesteImage =
      'https://cdn.cloudflare.steamstatic.com/steam/apps/504230/header.jpg';

  static const List<GameData> games = [
    GameData(
      title: 'Persona 5 Royal',
      imageUrl: persona5Image,
      status: '진행 중',
      info: '18시간 · 8월',
      completed: false,
      progress: 0.42,
    ),
    GameData(
      title: 'INSIDE',
      imageUrl: insideImage,
      status: '완료',
      info: '4시간 · 9월 2일',
      completed: true,
      progress: 1,
    ),
    GameData(
      title: 'Hades',
      imageUrl: hadesImage,
      status: '완료',
      info: '25시간 · 8월 27일',
      completed: true,
      progress: 1,
    ),
    GameData(
      title: 'Stardew Valley',
      imageUrl: stardewImage,
      status: '시작 전',
      info: '아직 플레이하지 않음',
      completed: false,
      progress: 0.05,
    ),
    GameData(
      title: 'Celeste',
      imageUrl: celesteImage,
      status: '중단됨',
      info: '12시간 · 7월 14일',
      completed: false,
      progress: 0.38,
    ),
  ];
}

// ============================================================
// HEATMAP DATA
// ============================================================

const List<List<int>> _activityData = [
  [0, 0, 1, 0, 0, 2, 1],
  [1, 3, 2, 1, 2, 3, 1],
  [0, 2, 1, 2, 0, 2, 3],
  [2, 3, 2, 1, 3, 2, 2],
  [0, 1, 3, 2, 2, 3, 3],
];